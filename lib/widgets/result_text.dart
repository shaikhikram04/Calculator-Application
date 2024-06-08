import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ResultText extends StatelessWidget {
  ResultText({
    super.key,
    required this.text,
    required this.size,
    required this.weight,
    this.textAlign,
  });

  final String text;
  final double size;
  final FontWeight weight;
  TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: size,
            fontWeight: weight,
          ),
          textAlign: textAlign,
        ),
      ),
    );
  }
}
