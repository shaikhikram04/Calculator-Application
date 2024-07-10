import 'dart:math';

import 'package:flutter/material.dart';
import 'package:calculator_application/utils/globals.dart' as globals;
import 'package:google_fonts/google_fonts.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    super.key,
    required this.label,
    required this.btnColor,
    required this.onClick,
  })  : icon = null,
        image = null;

  const CircularButton.icon({
    super.key,
    required this.icon,
    required this.btnColor,
    required this.onClick,
  })  : label = null,
        image = null;

  const CircularButton.image({
    super.key,
    required this.image,
    required this.btnColor,
    required this.onClick,
  })  : label = null,
        icon = null;

  final String? label;
  final IconData? icon;
  final ImageProvider? image;
  final Color btnColor;
  final void Function() onClick;

  Widget _buildLabel() {
    double diameterOfBtn =
        min(globals.screenWidth! * 0.19, globals.screenHeight! * 0.09);

    if (icon != null) {
      return Icon(
        icon,
        size: diameterOfBtn * 0.45,
      );
    } else if (label != null) {
      return Text(
        label!,
        style: GoogleFonts.roboto(
          fontSize: diameterOfBtn * 0.40,
          fontWeight: FontWeight.w500,
        ),
      );
    } else {
      return ImageIcon(
        image,
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
