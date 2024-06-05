import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.expression, this.result, {super.key});

  final String expression;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: const Color.fromARGB(255, 65, 85, 95),
      ),
      height: 300,
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            expression,
            style: const TextStyle(color: Colors.white, fontSize: 40),
          ),
          Text(
            result,
            style: const TextStyle(color: Colors.white, fontSize: 50),
          )
        ],
      ),
    );
  }
}
