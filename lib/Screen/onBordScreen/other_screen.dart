import 'package:flutter/material.dart';
import 'package:project_expense/Constants/colors.dart';
import 'package:project_expense/Constants/constants.dart';

class OtherScreen extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String description;

  const OtherScreen({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefalutPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imgUrl,
            width: 200,
            fit: BoxFit.cover,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: kBlack,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: kGrey,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
