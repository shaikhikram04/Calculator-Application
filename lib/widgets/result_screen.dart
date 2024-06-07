import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen(this.expression, this.result, {super.key});

  final String expression;
  final String result;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    String compressedResult = widget.result;
    if (widget.result.isNotEmpty && !widget.result.startsWith('I')) {
      double ans = double.parse(widget.result);
      compressedResult = ans.toString();
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: const Color.fromARGB(255, 40, 53, 59),
      ),
      height: 300,
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.expression,
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    compressedResult,
                    style: GoogleFonts.lato(color: Colors.white, fontSize: 50),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
