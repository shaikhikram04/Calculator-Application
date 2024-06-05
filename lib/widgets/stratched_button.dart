import 'package:flutter/material.dart';

class StratchedButton extends StatelessWidget {
  const StratchedButton(
      {super.key,
      required this.text,
      required this.color,
      required this.isVertical,
      required this.onClick});

  final Object text;
  final Color color;
  final bool isVertical;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        fixedSize: isVertical ? const Size(90, 180) : const Size(200, 85),
      ),
      onPressed: onClick,
      child: Center(
        child: (color == Colors.amber.shade700)
            ? Icon(
                text as IconData,
                size: 40,
              )
            : Text(
                text as String,
                style: const TextStyle(fontSize: 40),
              ),
      ),
    );
  }
}
