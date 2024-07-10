import 'package:calculator_application/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:calculator_application/utils/globals.dart' as globals;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

var theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xE10B0B0B)),
  textTheme: GoogleFonts.firaCodeTextTheme(),
);

void main() {
  runApp(const ProviderScope(child: Calculator()));
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    globals.screenHeight = MediaQuery.sizeOf(context).height;
    globals.screenWidth = MediaQuery.sizeOf(context).width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const MainScreen(),
    );
  }
}
