import 'package:calculator_application/utils/colors_util.dart';
import 'package:calculator_application/widgets/circular_button.dart';
import 'package:calculator_application/widgets/result_screen.dart';
import 'package:calculator_application/widgets/stratched_button.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF1D232B),
            Color(0xFF323B45),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 35),
          const ResultScreen(),
          const Divider(
            color: Colors.blueGrey,
            indent: 20,
            endIndent: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularButton(text: 'C', btnColor: otherBtnColor),
              CircularButton(text: 'Del', btnColor: otherBtnColor),
              CircularButton(text: '(', btnColor: otherBtnColor),
              CircularButton(text: ')', btnColor: otherBtnColor),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularButton(text: '%', btnColor: operatorBtnColor),
              CircularButton(text: '^', btnColor: operatorBtnColor),
              CircularButton(text: '/', btnColor: operatorBtnColor),
              CircularButton(text: '*', btnColor: operatorBtnColor),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularButton(text: '7', btnColor: numberedBtnColor),
              CircularButton(text: '8', btnColor: numberedBtnColor),
              CircularButton(text: '9', btnColor: numberedBtnColor),
              CircularButton(text: '-', btnColor: operatorBtnColor),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularButton(text: '4', btnColor: numberedBtnColor),
              CircularButton(text: '5', btnColor: numberedBtnColor),
              CircularButton(text: '6', btnColor: numberedBtnColor),
              CircularButton(text: '+', btnColor: operatorBtnColor),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      CircularButton(text: '1', btnColor: numberedBtnColor),
                      const SizedBox(width: 18),
                      CircularButton(text: '2', btnColor: numberedBtnColor),
                      const SizedBox(width: 18),
                      CircularButton(text: '3', btnColor: numberedBtnColor),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      StratchedButton(
                        text: '0',
                        color: numberedBtnColor,
                        isVertical: false,
                      ),
                      const SizedBox(width: 18),
                      CircularButton(text: '.', btnColor: numberedBtnColor),
                    ],
                  ),
                ],
              ),
              StratchedButton(
                color: operatorBtnColor,
                text: '=',
                isVertical: true,
              )
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
