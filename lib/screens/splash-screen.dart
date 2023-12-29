import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_clone/const/default.dart';
import 'package:netflix_clone/screens/home-screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: dbackgroundColor,
      splashIconSize: MediaQuery.sizeOf(context).height,
      splash: Lottie.asset('assets/json/netflix.json'),
      duration: 2500,
      nextScreen: const HomeScreen(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
