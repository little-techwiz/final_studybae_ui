import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studybae/core/configs/theme/app_colours.dart';
import 'package:studybae/core/configs/theme/app_theme.dart';
import 'package:studybae/core/utils/route.dart';
import 'package:studybae/features/splash/presentation/pages/splash_page.dart';

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const StudyBaeApp());
}

Future<ThemeMode> _loadThemeMode() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? theme = prefs.getString('themeMode');
  if (theme == 'dark') {
    return ThemeMode.dark;
  } else if (theme == 'light') {
    return ThemeMode.light;
  } else {
    return ThemeMode.system; // Default to system theme
  }
}

class StudyBaeApp extends StatefulWidget {
  const StudyBaeApp({super.key});

  @override
  State<StudyBaeApp> createState() => _StudyBaeAppState();
}

class _StudyBaeAppState extends State<StudyBaeApp> {
  late ValueNotifier<ThemeMode> themeNotifier;

  @override
  void initState() {
    super.initState();
    themeNotifier = ValueNotifier(ThemeMode.system); // Initialize with a default value
  }

  @override
  Widget build(BuildContext context) {
    TextTheme googleTextTheme = GoogleFonts.poppinsTextTheme();

    return FutureBuilder<ThemeMode>(
      future: _loadThemeMode(), // Use _loadThemeMode() to get theme mode
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Show a loading indicator
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}'); // Handle errors
        } else {
          // Once the theme is loaded, set it to themeNotifier
          themeNotifier.value = snapshot.data!;

          return ValueListenableBuilder<ThemeMode>(
            valueListenable: themeNotifier,
            builder: (context, themeMode, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Study Bae App',
                theme: lightTheme(googleTextTheme),
                darkTheme: darkTheme(googleTextTheme),
                themeMode: themeMode, // Use the current theme mode from ValueNotifier
                initialRoute: '/',
                onGenerateRoute: RouteGenerator.generateRoute,
                home: const SplashScreen(),
              );
            },
          );
        }
      },
    );
  }
}
