import 'package:calculator_application/providers/search_history_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var searchHistory = ref.watch(searchHistoryProvider);
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
