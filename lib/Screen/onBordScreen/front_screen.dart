import 'package:flutter/material.dart';
import 'package:project_expense/Constants/colors.dart';

class FrontScreen extends StatelessWidget {
  const FrontScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/img/logo.png",
          width: 100,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Expenz",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: kMainColor,
          ),
        )
      ],
    );
  }
}
