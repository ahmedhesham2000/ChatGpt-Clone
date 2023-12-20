import 'package:chatgpt_clone/controller/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegenerateWidget extends StatelessWidget {
  const RegenerateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return InkWell(
      onTap: () {
        cubit.chatList.removeLast();
        cubit.sendMessage(cubit.chatList.last.message!);
      },
      child: Container(
        width: 189,
        height: 30,
        padding:
        const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
        decoration: ShapeDecoration(
          color: const Color(0xFF202123),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Colors.white.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icon/regenerate_icon.svg',
              height: 16,
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              'Regenerate response',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
