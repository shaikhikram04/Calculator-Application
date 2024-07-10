import 'package:calculator_application/providers/result_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:calculator_application/utils/colors_util.dart';
import 'package:calculator_application/widgets/buttons/circular_button.dart';
import 'package:calculator_application/widgets/buttons/stratched_button.dart';
import 'package:flutter/cupertino.dart';

List<CircularButton> getUpperButtons(WidgetRef ref) {
  List<CircularButton> upperButtons = [
    CircularButton(
      label: 'C',
      btnColor: otherBtnColor,
      onClick: ref.read(resultDataProvider.notifier).clearExpression,
    ),
    CircularButton(
      label: 'Del',
      btnColor: otherBtnColor,
      onClick: ref.read(resultDataProvider.notifier).delExpression,
    ),
    CircularButton(
      label: '(',
      btnColor: otherBtnColor,
      onClick: () {
        ref.read(resultDataProvider.notifier).addExpression('(');
      },
    ),
    CircularButton(
      label: ')',
      btnColor: otherBtnColor,
      onClick: () {
        ref.read(resultDataProvider.notifier).addExpression(')');
      },
    ),
    CircularButton.icon(
      icon: Icons.percent,
      btnColor: operatorBtnColor,
      onClick: () {
        ref.read(resultDataProvider.notifier).replaceOperator('%');
      },
    ),
    CircularButton.icon(
      icon: Icons.keyboard_arrow_up,
      btnColor: operatorBtnColor,
      onClick: () {
        ref.read(resultDataProvider.notifier).replaceOperator('^');
      },
    ),
    CircularButton.icon(
      icon: CupertinoIcons.divide,
      btnColor: operatorBtnColor,
      onClick: () {
        ref.read(resultDataProvider.notifier).replaceOperator('÷');
      },
    ),
    CircularButton.icon(
      icon: CupertinoIcons.multiply,
      btnColor: operatorBtnColor,
      onClick: () {
        ref.read(resultDataProvider.notifier).replaceOperator('x');
      },
    ),
    for (int i = 7; i <= 9; i++)
      CircularButton(
        label: '$i',
        btnColor: numberedBtnColor,
        onClick: () {
          ref.read(resultDataProvider.notifier).addExpression('$i');
        },
      ),
    CircularButton.icon(
      icon: CupertinoIcons.minus,
      btnColor: operatorBtnColor,
      onClick: () {
        ref.read(resultDataProvider.notifier).replaceOperator('-');
      },
    ),
    for (int i = 4; i <= 6; i++)
      CircularButton(
        label: '$i',
        btnColor: numberedBtnColor,
        onClick: () {
          ref.read(resultDataProvider.notifier).addExpression('$i');
        },
      ),
    CircularButton.icon(
      icon: CupertinoIcons.add,
      btnColor: operatorBtnColor,
      onClick: () {
        ref.read(resultDataProvider.notifier).replaceOperator('+');
      },
    ),
  ];

  return upperButtons;
}

List<Widget> getLowerButtons(WidgetRef ref) {
  List<Widget> lowerButtons = [
    for (int i = 1; i <= 3; i++)
      CircularButton(
        label: '$i',
        btnColor: numberedBtnColor,
        onClick: () {
          ref.read(resultDataProvider.notifier).addExpression('$i');
        },
      ),
    CircularButton.image(
      image: const AssetImage('assets/images/negate_icon.png'),
      btnColor: numberedBtnColor,
      onClick: () {},
    ),
    CircularButton(
      label: '0',
      btnColor: numberedBtnColor,
      onClick: () {
        ref.read(resultDataProvider.notifier).addExpression('0');
      },
    ),
    CircularButton(
      label: '.',
      btnColor: numberedBtnColor,
      onClick: () {
        ref.read(resultDataProvider.notifier).addExpression('.');
      },
    ),
    StratchedButton(
      color: operatorBtnColor,
      icon: CupertinoIcons.equal,
      onClick: ref.read(resultDataProvider.notifier).calculate,
    )
  ];

  return lowerButtons;
}
