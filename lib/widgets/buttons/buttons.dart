import 'package:calculator_application/widgets/buttons/bottom_buttons.dart';
import 'package:calculator_application/widgets/buttons/buttons_row.dart';
import 'package:calculator_application/widgets/buttons/circular_button.dart';
import 'package:flutter/cupertino.dart';

class Buttons extends StatelessWidget {
  const Buttons(
      {super.key, required this.upperButtons, required this.lowerButtons});

  final List<CircularButton> upperButtons;
  final List<Widget> lowerButtons;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: ButtonsRow(buttonList: upperButtons, initialIndex: 0)),
        Expanded(child: ButtonsRow(buttonList: upperButtons, initialIndex: 4)),
        Expanded(child: ButtonsRow(buttonList: upperButtons, initialIndex: 8)),
        Expanded(child: ButtonsRow(buttonList: upperButtons, initialIndex: 12)),
        Expanded(
          flex: 2,
          child: BottomButtons(
            lowerButtons: lowerButtons,
          ),
        )
      ],
    );
  }
}
