import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studybae/core/utils/constants.dart';
import 'package:studybae/core/utils/route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateToSignUp();
  }
  @override
  Widget build(BuildContext context) {
    return const SplashScreenWidget();
  }

  _navigateToSignUp() async{
    await Future.delayed(const Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, getStartedScreen);
    });
  }
}

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top SVG Image
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.topLeft,
              child: SvgPicture.asset(
                '${vectorPath}page_style_element.svg',
                fit: BoxFit.contain,
                alignment: Alignment.topLeft,
              ),
            ),
          ),
          // Text SVG
          Expanded(
            flex: 4,
            child: Center(
              child: SvgPicture.asset(
                '${vectorPath}logo.svg',
                // width: 200, // Adjust the size if needed
              ),
            ),
          ),
        ],
      ),
    );
  }
}

