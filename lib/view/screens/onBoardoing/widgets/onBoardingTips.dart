import 'package:flutter/material.dart';

class OnBoardingTipsWidget extends StatelessWidget {
   OnBoardingTipsWidget({super.key, required this.text});
String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.82,
      height: MediaQuery.of(context).size.height * 0.08,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.07),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child:   Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w500,
          height: 0,
        ),
      ),
    );
  }
}
