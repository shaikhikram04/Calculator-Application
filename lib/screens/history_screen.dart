import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var searchHistory = [];
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
