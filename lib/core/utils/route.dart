import 'package:flutter/material.dart';
import 'package:studybae/features/ai/presentation/pages/ai_chat_page.dart';
import 'package:studybae/features/auth/presentation/pages/authPage.dart';
import 'package:studybae/features/downloads/presentation/pages/downloads_page.dart';
import 'package:studybae/features/home/presentation/pages/home_page.dart';
import 'package:studybae/features/profiles/presentation/pages/profile_page.dart';
import 'package:studybae/features/search/presentation/%20pages/search_page.dart';
import 'package:studybae/features/settings/presentation/pages/settings_page.dart';
import 'package:studybae/features/splash/presentation/pages/get_started.dart';
import 'package:studybae/features/splash/presentation/pages/splash_page.dart';
import 'package:studybae/features/streaks/presentation/pages/streaks_page.dart';
import 'package:studybae/features/study_resources/presentation/pages/study_page.dart';

const String splashScreen = "/splashScreeen";
const String getStartedScreen = "/getStartedScreen";
const String homePage = "/homePage";
const String authPage = "/authPage";
const String downloadPage = "/downloadPage";
const String studyPage = "/studyPage";
const String profilePage = "/profilePage";
const String settingsPage =  "/settingsPage";
const String streaksPage = "/streaksPage";
const String chatPage = "/chatPage";
const String searchPage = "/searchPage";

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case getStartedScreen:
        return MaterialPageRoute(builder: (_) => const GetStarted());
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case authPage:
        return MaterialPageRoute(builder: (_) => const AuthPage());
      case downloadPage:
        return MaterialPageRoute(builder: (_) => const DownloadPage());
      case studyPage:
        return MaterialPageRoute(builder: (_) => const StudyPage());
      case profilePage:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case settingsPage:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case streaksPage:
        return MaterialPageRoute(builder: (_) => const StreaksPage());
      case chatPage:
        return MaterialPageRoute(builder: (_) => ChatScreen());
      case searchPage:
        return MaterialPageRoute(builder: (_) => const SearchPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}