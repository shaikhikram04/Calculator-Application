import 'package:calculator_application/custom_data_structure/result_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchHistoryNotifier extends StateNotifier<List<ResultData>> {
  SearchHistoryNotifier() : super([]);

  void addData(ResultData newData) {
    state = [...state, newData];
  }
}

final searchHistoryProvider =
    StateNotifierProvider<SearchHistoryNotifier, List<ResultData>>(
  (ref) => SearchHistoryNotifier(),
);
