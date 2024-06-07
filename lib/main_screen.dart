import 'package:calculator_application/custom_data_structure/result_data.dart';
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
  ResultData data = ResultData();
  List<ResultData> searchHistory = [];

  @override
  Widget build(BuildContext context) {
    void addExpression(String input) {
      setState(() {
        data.expression += input;
      });
    }

    void clearExpression() {
      setState(() {
        data.expression = '';
        data.result = '';
      });
    }

    void delExpression() {
      if (data.expression.isNotEmpty) {
        setState(() {
          data.expression =
              data.expression.substring(0, data.expression.length - 1);
        });
      }
    }

    bool isOperator(String ch) {
      return (ch == '+' ||
          ch == '-' ||
          ch == '*' ||
          ch == '÷' ||
          ch == '^' ||
          ch == '%');
    }

    void replaceOperator(String optr) {
      if (data.expression.isNotEmpty &&
          isOperator(data.expression[data.expression.length - 1])) {
        delExpression();
      }
      addExpression(optr);
    }

    void calculate() {
      setState(() {
        data.result = getResult(data.expression)!;
        searchHistory.add(data);
      });
    }

    return Container(
      color: const Color(0xF5000000),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 50),
          ResultScreen(data),
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
                  replaceOperator('%');
                },
              ),
              CircularButton(
                text: Icons.keyboard_arrow_up,
                btnColor: operatorBtnColor,
                onClick: () {
                  replaceOperator('^');
                },
              ),
              CircularButton(
                text: CupertinoIcons.divide,
                btnColor: operatorBtnColor,
                onClick: () {
                  replaceOperator('÷');
                },
              ),
              CircularButton(
                text: CupertinoIcons.multiply,
                btnColor: operatorBtnColor,
                onClick: () {
                  replaceOperator('*');
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
                  replaceOperator('-');
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
                  replaceOperator('+');
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
