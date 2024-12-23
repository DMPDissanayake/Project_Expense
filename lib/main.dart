import 'package:flutter/material.dart';
import 'package:project_expense/Screen/on_borad_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "E-Commerce App",
      theme: ThemeData(fontFamily: "Inter"),
      home: OnBoradScreen(),
    );
  }
}
