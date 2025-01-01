import 'package:flutter/material.dart';
import 'package:project_expense/Constants/colors.dart';
import 'package:project_expense/Data/onboradscreendata.dart';
import 'package:project_expense/Screen/onBordScreen/front_screen.dart';
import 'package:project_expense/Screen/onBordScreen/other_screen.dart';
import 'package:project_expense/Screen/user_detaile_page.dart';
import 'package:project_expense/Widgets/main_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoradScreen extends StatefulWidget {
  const OnBoradScreen({super.key});

  @override
  State<OnBoradScreen> createState() => _OnBoradScreenState();
}

class _OnBoradScreenState extends State<OnBoradScreen> {
  //pageController
  PageController _controller = PageController();
  //shoePage
  bool shoePage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                //onBordScreen
                PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      shoePage = index == 3;
                    });
                  },
                  children: [
                    FrontScreen(),
                    OtherScreen(
                      imgUrl: OnBoradData.onBordDataList[0].image,
                      title: OnBoradData.onBordDataList[0].title,
                      description: OnBoradData.onBordDataList[0].description,
                    ),
                    OtherScreen(
                      imgUrl: OnBoradData.onBordDataList[1].image,
                      title: OnBoradData.onBordDataList[1].title,
                      description: OnBoradData.onBordDataList[1].description,
                    ),
                    OtherScreen(
                      imgUrl: OnBoradData.onBordDataList[2].image,
                      title: OnBoradData.onBordDataList[2].title,
                      description: OnBoradData.onBordDataList[2].description,
                    ),
                  ],
                ),
                //indicator
                Container(
                  alignment: Alignment(0, 0.75),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                    effect: WormEffect(
                      activeDotColor: kMainColor,
                      dotColor: kGrey,
                    ),
                  ),
                ),
                //skip button
                Positioned(
                  bottom: 20,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: !shoePage
                        ? GestureDetector(
                            onTap: () {
                              _controller.animateToPage(
                                  _controller.page!.toInt() + 1,
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.easeInOut);
                            },
                            child: MainButton(
                              bColor: kMainColor,
                              text: shoePage ? "Get Started" : "Next",
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserDetailePage(),
                                ),
                              );
                            },
                            child: MainButton(
                              bColor: kMainColor,
                              text: shoePage ? "Get Started" : "Next",
                            ),
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
