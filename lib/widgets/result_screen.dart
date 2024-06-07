import 'package:calculator_application/custom_data_structure/result_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ResultScreen extends StatelessWidget {
  ResultScreen(this.data, {super.key});

  ResultData data = ResultData();

  @override
  Widget build(BuildContext context) {
    String compressedResult = data.result;
    if (data.result.isNotEmpty && !data.result.startsWith('I')) {
      double ans = double.parse(data.result);
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
                    data.expression,
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
