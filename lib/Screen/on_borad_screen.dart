import 'package:flutter/material.dart';
import 'package:project_expense/Data/onboradscreendata.dart';
import 'package:project_expense/Screen/onBordScreen/front_screen.dart';
import 'package:project_expense/Screen/onBordScreen/other_screen.dart';

class OnBoradScreen extends StatefulWidget {
  const OnBoradScreen({super.key});

  @override
  State<OnBoradScreen> createState() => _OnBoradScreenState();
}

class _OnBoradScreenState extends State<OnBoradScreen> {
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
