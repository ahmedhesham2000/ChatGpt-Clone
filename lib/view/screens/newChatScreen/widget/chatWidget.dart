import 'package:chatgpt_clone/controller/cubit/app_cubit.dart';
import 'package:chatgpt_clone/core/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.isUser, required this.msg});

  final String msg;
  final bool isUser;

  // padding: isUser?const EdgeInsets.only(left: 100.0,right: 10):const EdgeInsets.only(left: 10.0,right: 300),

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment:
            isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isUser
                  ? AppColors.greenColor
                  : AppColors.whiteColor.withOpacity(0.2),
              borderRadius: BorderRadius.only(
                  topRight: const Radius.circular(8),
                  topLeft: const Radius.circular(8),
                  bottomLeft: isUser
                      ? const Radius.circular(8)
                      : const Radius.circular(0),
                  bottomRight: isUser
                      ? const Radius.circular(0)
                      : const Radius.circular(9)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                msg,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w600,
                ),
              )
            ),
          ),
          isUser
              ? const SizedBox.shrink()
              : Padding(
                padding: const EdgeInsets.only(top:12.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/icon/like_icon.svg'),
                      const SizedBox(
                        width: 20,
                      ),
                      SvgPicture.asset('assets/icon/disLike_icon.svg'),
                      const SizedBox(
                        width: 20,
                      ),
                      SvgPicture.asset('assets/icon/copy_icon.svg'),
                      const SizedBox(
                        width: 5,
                      ),
                       InkWell(
                         onTap: ()async{
                           await Clipboard.setData(ClipboardData(text: msg));
                           const snackBar = SnackBar(
                             duration: Duration(seconds: 2),
                             content: Text('Copied to Clipboard'));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);

                         },
                         child: const Text(
                          'Copy',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w600,
                          ),
                                               ),
                       )
                    ],
                  ),
              ),
        ],
      ),
    );
  }
}
