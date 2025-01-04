import 'package:flutter/material.dart';

class Bugets extends StatefulWidget {
  const Bugets({super.key});

  @override
  State<Bugets> createState() => _BugetsState();
}

class _BugetsState extends State<Bugets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Bugets"),
      ),
    );
  }
}
