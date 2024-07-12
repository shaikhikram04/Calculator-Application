import 'package:calculator_application/custom_data_structure/result_data.dart';
import 'package:calculator_application/functions/calculate.dart';
import 'package:calculator_application/providers/search_history_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultDataNotifier extends StateNotifier<ResultData> {
  ResultDataNotifier(this.ref) : super(ResultData('', ''));

  final StateNotifierProviderRef<ResultDataNotifier, ResultData> ref;

  void addExpression(String input) {
    state = ResultData(
      state.expression + input,
      state.result,
    );
  }

  void clearExpression() {
    state = ResultData('', '');
  }

  void delExpression() {
    if (state.expression.isNotEmpty) {
      state = ResultData(
        state.expression,
        state.result,
      );
    }
  }

  void replaceOperator(String optr) {
    if (state.expression.isNotEmpty &&
        isOperator(state.expression[state.expression.length - 1])) {
      delExpression();
    } else if (state.expression.isEmpty) {
      addExpression('0');
    }
    addExpression(optr);
  }

  void negate() {
    if (state.expression[0] == '+') {
      state = ResultData(
          '-${state.expression.substring(1, state.expression.length)}',
          state.result);
    } else if (state.expression[0] == '-') {
      state = ResultData(
          '+${state.expression.substring(1, state.expression.length)}',
          state.result);
    } else {
      state = ResultData('-${state.expression}', state.result);
    }
  }

  void calculate() {
    state = ResultData(state.expression, getResult(state.expression));
    ref.read(searchHistoryProvider.notifier).addData(state);
  }
}

final resultDataProvider =
    StateNotifierProvider<ResultDataNotifier, ResultData>(
  (ref) => ResultDataNotifier(ref),
);
