import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton(
      {super.key,
      required this.text,
      required this.btnColor,
      required this.onClick});
  final Object text;
  final Color btnColor;
  final void Function() onClick;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: btnColor,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(15),
        fixedSize: const Size(90, 85),
      ),
      onPressed: onClick,
      child: (btnColor == Colors.amber.shade700)
          ? Icon(
              text as IconData,
              size: 40,
            )
          : Text(
              text as String,
              style: const TextStyle(fontSize: 40),
            ),
    );
  }
}
