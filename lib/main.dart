import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "E-Commerce App",
      theme: ThemeData(fontFamily: "Inter"),
      home: Scaffold(
        body: Center(
          child: Text(
            "Sri Lanaka",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
