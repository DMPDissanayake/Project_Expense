import 'package:flutter/material.dart';
import 'package:project_expense/Constants/colors.dart';

class MainButton extends StatelessWidget {
  final Color bColor;
  final String text;
  const MainButton({
    super.key,
    required this.bColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            text,
            style: TextStyle(
              color: kWhite,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
