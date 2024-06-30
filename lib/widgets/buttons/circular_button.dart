import 'dart:math';

import 'package:flutter/material.dart';
import 'package:calculator_application/utils/globals.dart' as globals;

class CircularButton extends StatelessWidget {
  const CircularButton(
      {super.key,
      required this.label,
      required this.btnColor,
      required this.onClick});
  final Object label;
  final Color btnColor;
  final void Function() onClick;

  Widget _buildLabel() {
    double diameterOfBtn =
        min(globals.screenWidth! * 0.19, globals.screenHeight! * 0.09);

    if (label is IconData) {
      return Icon(
        label as IconData,
        size: diameterOfBtn * 0.45,
      );
    } else if (label is String) {
      return Text(
        label as String,
        style: TextStyle(fontSize: diameterOfBtn * 0.40),
      );
    } else {
      return ImageIcon(
        label as ImageProvider,
        size: diameterOfBtn * 0.45,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: btnColor,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(15),
        fixedSize: Size(
          globals.screenWidth! * 0.19,
          globals.screenHeight! * 0.09,
        ),
      ),
      onPressed: onClick,
      child: _buildLabel(),
    );
  }
}
