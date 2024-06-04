import 'package:flutter/material.dart';

class StratchedButton extends StatelessWidget {
  const StratchedButton(
      {super.key,
      required this.text,
      required this.color,
      required this.isVertical});

  final String text;
  final Color color;
  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        fixedSize: isVertical ? const Size(90, 180) : const Size(200, 85),
      ),
      onPressed: () {},
      child: Center(
          child: Text(
        text,
        style: const TextStyle(fontSize: 35),
      )),
    );
  }
}
