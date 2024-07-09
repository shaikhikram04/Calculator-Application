import 'package:calculator_application/custom_data_structure/result_data.dart';
import 'package:calculator_application/functions/calculate.dart';
import 'package:calculator_application/providers/search_history_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultDataNotifier extends StateNotifier<ResultData> {
  ResultDataNotifier(this.ref) : super(ResultData());

  final StateNotifierProviderRef<ResultDataNotifier, ResultData> ref;

  bool isOperator(String ch) {
    return (ch == '+' ||
        ch == '-' ||
        ch == '*' ||
        ch == '÷' ||
        ch == '^' ||
        ch == '%');
  }

  void addExpression(String input) {
    state.expression = state.expression + input;
  }

  void clearExpression() {
    state = ResultData();
  }

  void delExpression() {
    if (state.expression.isNotEmpty) {
      state.expression =
          state.expression.substring(0, state.expression.length - 1);
    }
  }

  void replaceOperator(String optr) {
    if (state.expression.isNotEmpty &&
        isOperator(state.expression[state.expression.length - 1])) {
      delExpression();
    }
    addExpression(optr);
  }

  void calculate() {
    state.result = getResult(state.expression)!;
    ref.read(searchHistoryProvider.notifier).addData(state);
  }
}

final resultDataProvider =
    StateNotifierProvider<ResultDataNotifier, ResultData>(
  (ref) => ResultDataNotifier(ref),
);
