import 'package:calculator_application/custom_data_structure/result_data.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key, required this.searchHistory});

  final List<ResultData> searchHistory;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: searchHistory.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Text(searchHistory[index].expression),
            Text(searchHistory[index].result),
          ],
        );
      },
    );
  }
}
