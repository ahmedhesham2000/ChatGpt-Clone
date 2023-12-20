import 'package:chatgpt_clone/view/screens/onBoardoing/widgets/onBoardingTips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PageViewPages extends StatelessWidget {
   PageViewPages({super.key,required this.title,required this.icon,required this.tipText1,required this.tipText2,required this.tipText3});
  String title;
  String icon;
  String tipText1;
  String tipText2;
  String tipText3;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          icon,
          height: 20,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
         Text(title,style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500
        ),),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        OnBoardingTipsWidget(
          text: tipText1,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,

        ),
        OnBoardingTipsWidget(
          text: tipText2,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,

        ),
        OnBoardingTipsWidget(
          text: tipText3,

        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,

        ),

      ],
    );
  }
}
