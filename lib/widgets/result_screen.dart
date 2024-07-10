import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:calculator_application/providers/result_data_provider.dart';
import 'package:calculator_application/utils/globals.dart' as globals;

class ResultScreen extends ConsumerWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(resultDataProvider);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: const Color.fromARGB(255, 40, 53, 59),
      ),
      height: globals.screenHeight! * 0.3,
      width: globals.screenWidth! * 0.96,
      margin: EdgeInsets.only(bottom: globals.screenHeight! * 0.003),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  data.expression,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data.result,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: Colors.white,
                        ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
