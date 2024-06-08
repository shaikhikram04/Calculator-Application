import 'package:calculator_application/utils/colors_util.dart';
import 'package:calculator_application/widgets/circular_button.dart';
import 'package:calculator_application/widgets/stratched_button.dart';
import 'package:flutter/cupertino.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons(this.addElement, this.calculate, {super.key});

  final void Function(String input) addElement;
  final void Function() calculate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Row(
              children: [
                CircularButton(
                  text: '1',
                  btnColor: numberedBtnColor,
                  onClick: () {
                    addElement('1');
                  },
                ),
                const SizedBox(width: 19),
                CircularButton(
                  text: '2',
                  btnColor: numberedBtnColor,
                  onClick: () {
                    addElement('2');
                  },
                ),
                const SizedBox(width: 19),
                CircularButton(
                  text: '3',
                  btnColor: numberedBtnColor,
                  onClick: () {
                    addElement('3');
                  },
                ),
              ],
            ),
            const SizedBox(height: 7),
            Row(
              children: [
                StratchedButton(
                  text: '0',
                  color: numberedBtnColor,
                  isVertical: false,
                  onClick: () {
                    addElement('0');
                  },
                ),
                const SizedBox(width: 24),
                CircularButton(
                  text: '.',
                  btnColor: numberedBtnColor,
                  onClick: () {
                    addElement('.');
                  },
                ),
              ],
            ),
          ],
        ),
        const SizedBox(width: 28),
        StratchedButton(
          color: operatorBtnColor,
          text: CupertinoIcons.equal,
          isVertical: true,
          onClick: calculate,
        )
      ],
    );
  }
}
