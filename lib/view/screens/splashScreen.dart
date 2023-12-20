import 'dart:ui';

import 'package:chatgpt_clone/core/shared/colors.dart';
import 'package:chatgpt_clone/view/screens/onBoardoing/onBoardingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => OnBoardingScreen(),), (route) => false);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: SvgPicture.asset(
                'assets/icon/icon.svg',
                height: 108,
                width: 108,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'ChatGPT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
