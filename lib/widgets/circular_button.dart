import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({super.key, required this.text, required this.btnColor});
  final String text;
  final Color btnColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: btnColor,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(15),
        fixedSize: const Size(90, 90),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(fontSize: 35),
      ),
    );
  }
}
