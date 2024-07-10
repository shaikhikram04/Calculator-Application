import 'package:flutter/cupertino.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key, required this.lowerButtons});

  final List<Widget> lowerButtons;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            lowerButtons[0],
            lowerButtons[3],
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            lowerButtons[1],
            lowerButtons[4],
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            lowerButtons[2],
            lowerButtons[5],
          ],
        ),
        lowerButtons[6]
      ],
    );
  }
}
