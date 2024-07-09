import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:calculator_application/custom_data_structure/result_data.dart';
import 'package:calculator_application/functions/buttons_list.dart';
import 'package:calculator_application/screens/history_screen.dart';
import 'package:calculator_application/widgets/buttons/buttons.dart';
import 'package:calculator_application/widgets/buttons/circular_button.dart';
import 'package:calculator_application/widgets/result_screen.dart';
import 'package:calculator_application/utils/globals.dart' as globals;

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  void showHistory() {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: const Color.fromARGB(245, 90, 89, 89),
      useSafeArea: true,
      context: context,
      builder: (context) => const HistoryScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<CircularButton> upperButtons = getUpperButtons(ref);
    List<Widget> lowerButtons = getLowerButtons(ref);

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
              child: ResultScreen(),
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
