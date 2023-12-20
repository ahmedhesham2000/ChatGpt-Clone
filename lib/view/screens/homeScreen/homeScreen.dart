import 'package:chatgpt_clone/controller/cubit/app_cubit.dart';
import 'package:chatgpt_clone/core/shared/colors.dart';
import 'package:chatgpt_clone/view/screens/homeScreen/widgets/homeOptionsWidget.dart';
import 'package:chatgpt_clone/view/screens/newChatScreen/newChatScreen.dart';
import 'package:chatgpt_clone/view/screens/onBoardoing/onBoardingScreen.dart';
import 'package:chatgpt_clone/view/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.blackColor,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewChatScreen(),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: double.infinity,
                        height: 52,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 1.0,
                                color: AppColors.whiteColor.withOpacity(0.4)),
                          ),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icon/chat_icon.svg',
                              height: 24,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'New Chat',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Spacer(),
                             Icon(Icons.arrow_forward_ios_rounded,
                                color:  AppColors.whiteColor
                                    .withOpacity(0.5)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: ListView.separated(
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    cubit.chatList = cubit.allChatHistory[index];
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NewChatScreen(isNewChat: false),
                                        ));
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 52,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            width: 1.0,
                                            color: AppColors.whiteColor
                                                .withOpacity(0.4)),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icon/chat_icon.svg',
                                          height: 24,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          cubit.allChatHistory[index][0]
                                              .message!,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Raleway',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Spacer(),
                                         Icon(Icons.more_vert,
                                            color:  AppColors.whiteColor
                                                .withOpacity(0.5)),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                         Icon(Icons.arrow_forward_ios_rounded,
                                            color:  AppColors.whiteColor
                                                .withOpacity(0.5)),
                                      ],
                                    ),
                                  ),
                                ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 20,
                                ),
                            itemCount: cubit.allChatHistory.length)),
                  ),
                  Divider(
                    thickness: 1,
                    color: AppColors.whiteColor.withOpacity(0.4),
                  ),
                  HomeOptionsWidget(
                    title: 'Clear Conversations',
                    icon: 'assets/icon/clear_icon.svg',
                    onTap: () {
                      cubit.clearChatHistory();
                      // print('object');
                    },
                  ),
                  HomeOptionsWidget(
                    title: 'Upgrade to Plus',
                    icon: 'assets/icon/person_icon.svg',
                    isNew: true,
                  ),
                  HomeOptionsWidget(
                      title: 'Light mode',
                      icon: 'assets/icon/example_Icon.svg'),
                  HomeOptionsWidget(
                    title: 'Updates & FAQ',
                    icon: 'assets/icon/faq_icon.svg',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OnBoardingScreen(),
                          ));
                    },
                  ),
                  HomeOptionsWidget(
                    title: 'Logout',
                    icon: 'assets/icon/logout_icon.svg',
                    isLogout: true,
                    onTap: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SplashScreen(),), (route) => false);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
