import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.expression, {super.key});

  final String expression;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: const Color.fromARGB(255, 65, 85, 95),
      ),
      height: 300,
      width: 400,
      child: Center(
          child: Text(
        expression,
        style: const TextStyle(color: Colors.white, fontSize: 50),
      )),
    );
  }
}
