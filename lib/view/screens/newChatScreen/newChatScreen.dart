
import 'package:chatgpt_clone/controller/cubit/app_cubit.dart';
import 'package:chatgpt_clone/core/shared/colors.dart';
import 'package:chatgpt_clone/model/chatModel.dart';
import 'package:chatgpt_clone/view/screens/homeScreen/widgets/regenrateWidget.dart';
import 'package:chatgpt_clone/view/screens/newChatScreen/widget/chatWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewChatScreen extends StatefulWidget {
  NewChatScreen({super.key, this.isNewChat = true});

  bool isNewChat;

  @override
  State<NewChatScreen> createState() => _NewChatScreenState();
}

class _NewChatScreenState extends State<NewChatScreen> {
  bool isTyping = false;

  final TextEditingController _controller = TextEditingController();

  final ScrollController listScrollController = ScrollController();

  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    listScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) async {
        if (state is ChatErrorState || state is ChatSuccessState) {
          isTyping = false;
          listScrollController.animateTo(
              listScrollController.position.maxScrollExtent,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut);
        }
        if (state is ChatLoadingState) {
          isTyping = true;
          _controller.clear();
          _focusNode.unfocus();
        }
        if (state is GetLastChatHistorySuccessState) {
          cubit.chatList = [];
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.greyColor,
          appBar: AppBar(
            backgroundColor: AppColors.greyColor,
            title: const Text('New Chat',
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 16,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w600,
                )),
            leading: IconButton(
              onPressed: () async {
                if (widget.isNewChat) {
                  if (cubit.chatList.isNotEmpty) {
                    await cubit.saveLastChatHistory();
                  } else {
                    Navigator.pop(context);
                  }
                } else {
                  cubit.updateChatHistory();
                }
              },
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: AppColors.whiteColor,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/icon/icon.svg',
                  height: 24,
                ),
              ),
            ],
          ),
          body: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Flexible(
              child: cubit.chatList.isNotEmpty
                  ? Align(
                alignment: Alignment.bottomRight,
                    child: ListView.separated(
                      shrinkWrap: true,
                    // reverse: true,
                        controller: listScrollController,
                        itemCount: cubit.chatList.length,
                        separatorBuilder: (context, index) => Divider(
                              color: AppColors.whiteColor.withOpacity(0.1),
                            ),
                        itemBuilder: (context, index) {
                          return ChatWidget(
                              isUser: cubit.chatList[index].isUser!,
                              msg: cubit.chatList[index].message!);
                        }),
                  )
                  : Center(
                      child: Text(
                        'Ask anything, get your answer',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.4),
                          fontSize: 16,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
            ),
            if (isTyping)
               Padding(
                 padding: const EdgeInsets.only(top:15.0,left: 10),
                 child: Align(
                    alignment: Alignment.bottomLeft,
                   child: Container(
                     height: 30,
                     width: 60,
                     decoration: BoxDecoration(
                       color: AppColors.whiteColor.withOpacity(0.1),
                       borderRadius: const BorderRadius.only(
                           topRight: Radius.circular(8),
                           topLeft: Radius.circular(8),
                           bottomLeft: Radius.circular(0),
                           bottomRight: Radius.circular(8)
                       ),
                       border: Border.all(
                         color: AppColors.whiteColor.withOpacity(0.1),
                       ),
                     ),
                     child: const SpinKitThreeBounce(
                       color: AppColors.whiteColor,
                       size: 20,
                     ),
                   ),
                 ),
               ),
            if (cubit.chatList.isNotEmpty && !isTyping)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: RegenerateWidget(),
              ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                color: AppColors.whiteColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          style: const TextStyle(color: Colors.white),
                          focusNode: _focusNode,
                          onSubmitted: (value) async {},
                          decoration: const InputDecoration.collapsed(
                              hintText: "How can I help you",
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          cubit.chatList.add(ChatModel(
                            isUser: true,
                            message: _controller.text,
                          ));

                          cubit.sendMessage(_controller.text);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.1,
                          height: MediaQuery.of(context).size.height * 0.05,
                          padding: const EdgeInsets.all(4),
                          decoration: ShapeDecoration(
                            color: const Color(0xFF10A37F),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icon/send_icon.svg',
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
        );
      },
    );
  }
}
