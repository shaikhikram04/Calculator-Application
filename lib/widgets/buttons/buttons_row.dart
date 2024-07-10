import 'package:calculator_application/widgets/buttons/circular_button.dart';
import 'package:flutter/cupertino.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow(
      {super.key, required this.buttonList, required this.initialIndex});

  final List<CircularButton> buttonList;
  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = initialIndex; i < initialIndex + 4; i++) buttonList[i]
      ],
    );
  }
}
