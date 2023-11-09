import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/presentation/Layout_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 400.r,
      backgroundColor: ColorManage.white,
      duration: 2000,
      splash: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(
                  'https://images.squarespace-cdn.com/content/v1/57c58c3ae3df28187860a4cb/1a5d927d-4532-48c4-9cc6-97a9cc14a6fc/Artboard+14.png',
                ),
              )),
            ),
          ),
        ],
      ),
      nextScreen: const MainScreen(),
      splashTransition: SplashTransition.scaleTransition,
    );
  }
}
