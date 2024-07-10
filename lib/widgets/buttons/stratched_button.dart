import 'dart:math';

import 'package:flutter/material.dart';
import 'package:calculator_application/utils/globals.dart' as globals;

class StratchedButton extends StatelessWidget {
  const StratchedButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onClick,
  });

  final IconData icon;
  final Color color;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    double diameterOfBtn =
        min(globals.screenWidth! * 0.19, globals.screenHeight! * 0.09);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        fixedSize: Size(diameterOfBtn, globals.screenHeight! * 0.185),
      ),
      onPressed: onClick,
      child: Center(
        child: Icon(
          icon,
          size: diameterOfBtn * 0.5,
        ),
      ),
    );
  }
}
