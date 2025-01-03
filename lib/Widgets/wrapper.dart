import 'package:flutter/material.dart';
import 'package:project_expense/Screen/mainscreen.dart';
import 'package:project_expense/Screen/on_borad_screen.dart';

class Wrapper extends StatefulWidget {
  final bool showMainScreen;
  const Wrapper({
    super.key,
    required this.showMainScreen,
  });

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return widget.showMainScreen ? Mainscreen() : OnBoradScreen();
  }
}
