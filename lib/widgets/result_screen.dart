import 'package:calculator_application/custom_data_structure/result_data.dart';
import 'package:calculator_application/widgets/result_text.dart';
import 'package:flutter/material.dart';

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
      height: 290,
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              ResultText(
                  text: data.expression, size: 40, weight: FontWeight.w300)
            ],
          ),
          Row(
            children: [
              ResultText(
                text: compressedResult,
                size: 50,
                weight: FontWeight.normal,
                textAlign: TextAlign.right,
              )
            ],
          )
        ],
      ),
    );
  }
}
