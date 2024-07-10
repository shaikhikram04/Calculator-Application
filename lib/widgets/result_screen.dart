import 'package:calculator_application/providers/result_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:calculator_application/utils/globals.dart' as globals;

class ResultScreen extends ConsumerWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(resultDataProvider);
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
      height: globals.screenHeight! * 0.3,
      width: globals.screenWidth! * 0.96,
      margin: EdgeInsets.only(bottom: globals.screenHeight! * 0.003),
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
                    style: GoogleFonts.firaCode(
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
