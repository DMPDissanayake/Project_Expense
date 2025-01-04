import 'package:flutter/material.dart';

class Trasaction extends StatefulWidget {
  const Trasaction({super.key});

  @override
  State<Trasaction> createState() => _TrasactionState();
}

class _TrasactionState extends State<Trasaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Trasaction"),
      ),
    );
  }
}
