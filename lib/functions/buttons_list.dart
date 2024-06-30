import 'package:calculator_application/utils/colors_util.dart';
import 'package:calculator_application/widgets/buttons/circular_button.dart';
import 'package:calculator_application/widgets/buttons/stratched_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<CircularButton> getUpperButtons({
  required void Function() onClear,
  required void Function() onDelete,
  required void Function(String expn) addExpression,
  required void Function(String optr) replaceOperator,
}) {
  List<CircularButton> upperButtons = [
    CircularButton(
      label: 'C',
      btnColor: otherBtnColor,
      onClick: onClear,
    ),
    CircularButton(
      label: 'Del',
      btnColor: otherBtnColor,
      onClick: onDelete,
    ),
    CircularButton(
      label: '(',
      btnColor: otherBtnColor,
      onClick: () {
        addExpression('(');
      },
    ),
    CircularButton(
      label: ')',
      btnColor: otherBtnColor,
      onClick: () {
        addExpression(')');
      },
    ),
    CircularButton(
      label: Icons.percent,
      btnColor: operatorBtnColor,
      onClick: () {
        replaceOperator('%');
      },
    ),
    CircularButton(
      label: Icons.keyboard_arrow_up,
      btnColor: operatorBtnColor,
      onClick: () {
        replaceOperator('^');
      },
    ),
    CircularButton(
      label: CupertinoIcons.divide,
      btnColor: operatorBtnColor,
      onClick: () {
        replaceOperator('÷');
      },
    ),
    CircularButton(
      label: CupertinoIcons.multiply,
      btnColor: operatorBtnColor,
      onClick: () {
        replaceOperator('*');
      },
    ),
    CircularButton(
      label: '7',
      btnColor: numberedBtnColor,
      onClick: () {
        addExpression('7');
      },
    ),
    CircularButton(
      label: '8',
      btnColor: numberedBtnColor,
      onClick: () {
        addExpression('8');
      },
    ),
    CircularButton(
      label: '9',
      btnColor: numberedBtnColor,
      onClick: () {
        addExpression('9');
      },
    ),
    CircularButton(
      label: CupertinoIcons.minus,
      btnColor: operatorBtnColor,
      onClick: () {
        replaceOperator('-');
      },
    ),
    CircularButton(
      label: '4',
      btnColor: numberedBtnColor,
      onClick: () {
        addExpression('4');
      },
    ),
    CircularButton(
      label: '5',
      btnColor: numberedBtnColor,
      onClick: () {
        addExpression('5');
      },
    ),
    CircularButton(
      label: '6',
      btnColor: numberedBtnColor,
      onClick: () {
        addExpression('6');
      },
    ),
    CircularButton(
      label: CupertinoIcons.add,
      btnColor: operatorBtnColor,
      onClick: () {
        replaceOperator('+');
      },
    ),
  ];

  return upperButtons;
}

List<Widget> getLowerButtons({
  required void Function(String expn) addExpression,
  required void Function() calculate,
}) {
  List<Widget> lowerButtons = [
    CircularButton(
      label: '1',
      btnColor: numberedBtnColor,
      onClick: () {
        addExpression('1');
      },
    ),
    CircularButton(
      label: '2',
      btnColor: numberedBtnColor,
      onClick: () {
        addExpression('2');
      },
    ),
    CircularButton(
      label: '3',
      btnColor: numberedBtnColor,
      onClick: () {
        addExpression('3');
      },
    ),
    CircularButton(
      label: const AssetImage('assets/images/negate_icon.png'),
      btnColor: numberedBtnColor,
      onClick: () {},
    ),
    CircularButton(
      label: '0',
      btnColor: numberedBtnColor,
      onClick: () {
        addExpression('0');
      },
    ),
    CircularButton(
      label: '.',
      btnColor: numberedBtnColor,
      onClick: () {
        addExpression('.');
      },
    ),
    StratchedButton(
      color: operatorBtnColor,
      text: CupertinoIcons.equal,
      onClick: calculate,
    )
  ];

  return lowerButtons;
}
