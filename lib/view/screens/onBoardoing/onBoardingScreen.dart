import 'package:chatgpt_clone/core/shared/colors.dart';
import 'package:chatgpt_clone/view/screens/onBoardoing/widgets/pageViewPages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../homeScreen/homeScreen.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPage = 0;

  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icon/icon.svg',
            height: 24,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          const Text(
            'Welcome to ChatGPT',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          const Text(
            'Ask anything, get your answer',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          SizedBox(
            // width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.5,
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),

              children: [
                PageViewPages(
                    title: 'Example',
                    icon: 'assets/icon/example_Icon.svg',
                    tipText1: '“Explain quantum computing in simple terms”',
                    tipText2:
                        '“Got any creative ideas for a 10 year old’s birthday?”',
                    tipText3: '“How do I make an HTTP request in Javascript?”'),
                PageViewPages(
                    title: 'Capabilities',
                    icon: 'assets/icon/capabilities_icon.svg',
                    tipText1:
                        'Remembers what user said earlier in the conversation',
                    tipText2: 'Allows user to provide follow-up corrections',
                    tipText3: 'Trained to decline inappropriate requests'),
                PageViewPages(
                    title: 'Limitations',
                    icon: 'assets/icon/limitations_Icon.svg',
                    tipText1: 'May occasionally generate incorrect information',
                    tipText2:
                        'May occasionally produce harmful instructions or biased content',
                    tipText3:
                        'Limited knowledge of world and events after 2021'),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 28,
                height: 2,
                decoration: ShapeDecoration(
                  color: _currentPage==0? const Color(0xFF10A37F):Colors.white.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                width: 28,
                height: 2,
                decoration: ShapeDecoration(
                  color: _currentPage==1? const Color(0xFF10A37F):Colors.white.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                width: 28,
                height: 2,
                decoration: ShapeDecoration(
                  color: _currentPage==2? const Color(0xFF10A37F):Colors.white.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),

          InkWell(
            onTap: () {
              if(_currentPage!=2){
              setState(() {
                _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
                _currentPage++;
              });
              }
              else{
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const HomeScreen()), (route) => false);
              }

            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.06,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: ShapeDecoration(
                color: AppColors.greenColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child:  Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if(_currentPage!=2)
                  const Text(
                    'Next',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  if(_currentPage==2)
                     const Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisSize: MainAxisSize.min,

                       children: [
                         Text(
                          'Let\’s Chat',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                                             ),
                         Icon(Icons.arrow_right_alt_sharp,color: AppColors.whiteColor,)
                       ],
                     ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
