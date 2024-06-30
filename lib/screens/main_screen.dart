import 'package:calculator_application/custom_data_structure/result_data.dart';
import 'package:calculator_application/functions/buttons_list.dart';
import 'package:calculator_application/functions/calculate.dart';
import 'package:calculator_application/screens/history_screen.dart';
import 'package:calculator_application/widgets/buttons/buttons.dart';
import 'package:calculator_application/widgets/buttons/circular_button.dart';
import 'package:calculator_application/widgets/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:calculator_application/utils/globals.dart' as globals;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ResultData data = ResultData();
  List<ResultData> searchHistory = [];

  void showHistory() {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: const Color.fromARGB(245, 90, 89, 89),
      useSafeArea: true,
      context: context,
      builder: (context) => HistoryScreen(searchHistory: searchHistory),
    );
  }

  bool isOperator(String ch) {
    return (ch == '+' ||
        ch == '-' ||
        ch == '*' ||
        ch == '÷' ||
        ch == '^' ||
        ch == '%');
  }

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

  @override
  Widget build(BuildContext context) {
    List<CircularButton> upperButtons = getUpperButtons(
      onClear: clearExpression,
      onDelete: delExpression,
      addExpression: addExpression,
      replaceOperator: replaceOperator,
    );
    List<Widget> lowerButtons = getLowerButtons(
      addExpression: addExpression,
      calculate: calculate,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xF5000000),
        actions: [
          IconButton(
            onPressed: showHistory,
            icon: Icon(
              Icons.history,
              color: Colors.white,
              size: globals.screenWidth! * 0.095,
            ),
          )
        ],
      ),
      backgroundColor: const Color(0xF5000000),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: ResultScreen(data),
            ),
            const Divider(
              color: Colors.blueGrey,
              indent: 10,
              endIndent: 10,
            ),
            Expanded(
              flex: 7,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: globals.screenWidth! * 0.032,
                      vertical: globals.screenHeight! * 0.015),
                  child: Buttons(
                    upperButtons: upperButtons,
                    lowerButtons: lowerButtons,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
