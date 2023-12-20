import 'package:chatgpt_clone/core/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeOptionsWidget extends StatelessWidget {
   HomeOptionsWidget({super.key,required this.title,required this.icon,this.isNew=false,this.isLogout=false,this.onTap});
  String title;
  String icon;
  bool isNew;
  bool isLogout;
   void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              height: 24,
            ),
            const SizedBox(
              width: 10,
            ),
             Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: isLogout?AppColors.redColor:Colors.white,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            if(isNew)
            Container(
              width: 46,
              height: 20,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0.50),
              decoration: ShapeDecoration(
                color: Color(0xFFFAF3AD),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'NEW',
                    style: TextStyle(
                      color: Color(0xFF887A05),
                      fontSize: 12,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
