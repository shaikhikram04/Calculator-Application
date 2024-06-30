import 'package:calculator_application/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:calculator_application/utils/globals.dart' as globals;

void main() {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    globals.screenWidth = MediaQuery.of(context).size.width;
    globals.screenHeight = MediaQuery.of(context).size.height;
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
