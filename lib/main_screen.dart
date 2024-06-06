import 'package:calculator_application/functions/calculate.dart';
import 'package:calculator_application/utils/colors_util.dart';
import 'package:calculator_application/widgets/bottom_buttons.dart';
import 'package:calculator_application/widgets/circular_button.dart';
import 'package:calculator_application/widgets/result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String inputOperation = '';
  String result = '';

  @override
  Widget build(BuildContext context) {
    void addExpression(String input) {
      setState(() {
        inputOperation += input;
      });
    }

    void clearExpression() {
      setState(() {
        inputOperation = '';
      });
    }

    void delExpression() {
      setState(() {
        String temp = inputOperation.substring(0, inputOperation.length - 1);
        inputOperation = temp;
      });
    }

    void calculate() {
      setState(() {
        result = getResult(inputOperation).toStringAsFixed(4);
      });
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black,
            Colors.black12,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 35),
          ResultScreen(inputOperation, result),
          const Divider(
            color: Colors.blueGrey,
            indent: 10,
            endIndent: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularButton(
                text: 'C',
                btnColor: otherBtnColor,
                onClick: clearExpression,
              ),
              CircularButton(
                text: 'Del',
                btnColor: otherBtnColor,
                onClick: delExpression,
              ),
              CircularButton(
                text: '(',
                btnColor: otherBtnColor,
                onClick: () {
                  addExpression('(');
                },
              ),
              CircularButton(
                text: ')',
                btnColor: otherBtnColor,
                onClick: () {
                  addExpression(')');
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularButton(
                text: Icons.percent,
                btnColor: operatorBtnColor,
                onClick: () {
                  addExpression('%');
                },
              ),
              CircularButton(
                text: Icons.keyboard_arrow_up,
                btnColor: operatorBtnColor,
                onClick: () {
                  addExpression('^');
                },
              ),
              CircularButton(
                text: CupertinoIcons.divide,
                btnColor: operatorBtnColor,
                onClick: () {
                  addExpression('÷');
                },
              ),
              CircularButton(
                text: CupertinoIcons.multiply,
                btnColor: operatorBtnColor,
                onClick: () {
                  addExpression('*');
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularButton(
                text: '7',
                btnColor: numberedBtnColor,
                onClick: () {
                  addExpression('7');
                },
              ),
              CircularButton(
                text: '8',
                btnColor: numberedBtnColor,
                onClick: () {
                  addExpression('8');
                },
              ),
              CircularButton(
                text: '9',
                btnColor: numberedBtnColor,
                onClick: () {
                  addExpression('9');
                },
              ),
              CircularButton(
                text: CupertinoIcons.minus,
                btnColor: operatorBtnColor,
                onClick: () {
                  addExpression('-');
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularButton(
                text: '4',
                btnColor: numberedBtnColor,
                onClick: () {
                  addExpression('4');
                },
              ),
              CircularButton(
                text: '5',
                btnColor: numberedBtnColor,
                onClick: () {
                  addExpression('5');
                },
              ),
              CircularButton(
                text: '6',
                btnColor: numberedBtnColor,
                onClick: () {
                  addExpression('6');
                },
              ),
              CircularButton(
                text: CupertinoIcons.add,
                btnColor: operatorBtnColor,
                onClick: () {
                  addExpression('+');
                },
              ),
            ],
          ),
          BottomButtons(
            addExpression,
            calculate,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
