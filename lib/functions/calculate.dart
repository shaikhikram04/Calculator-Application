import 'dart:math';

import 'package:calculator_application/custom_data_structure/stack.dart'
    as custom_stack;

bool isDigit(String str) {
  return str.length == 1 && str.compareTo('0') >= 0 && str.compareTo('9') <= 0;
}

String addAsterisk(String expression) {
  String temp = '';
  for (int i = 0; i < expression.length; i++) {
    if (i > 0 && expression[i] == '(' && isDigit(expression[i - 1])) {
      temp += '*';
    } else if (i > 0 && expression[i - 1] == ')' && isDigit(expression[i])) {
      temp += '*';
    }
    temp += expression[i];
  }

  return temp;
}

List<String> getPostFix(String expression) {
  List<String> postFix = [];
  var op = custom_stack.Stack<String>();
  Map<String, int> precedence = {
    '+': 1,
    '-': 1,
    '*': 2,
    '÷': 2,
    '^': 3,
    '(': 4,
  };

  int i = 0;

  String firstOperandSign = '+';

  while (i < expression.length) {
    String ch = expression[i];

    //* case 1: number (0 - 9)
    if (isDigit(ch) || ch == '.') {
      String temp = '';
      while (i < expression.length &&
          (isDigit(expression[i]) || expression[i] == '.')) {
        temp += expression[i++];
      }
      if (postFix.isEmpty) {
        temp = firstOperandSign + temp;
      }
      postFix.add(temp);

      continue;
    }

    //* case 2: open parenthesis
    if (ch == '(') {
      op.push(ch);
    }

    //* case 3 : close braces )
    else if (ch == ')') {
      while (!op.isEmpty() && op.peek() != '(') {
        postFix.add(op.pop()!);
      }
      if (op.isEmpty()) {
        throw const FormatException("Unmatched parentheses");
      }
      op.pop();
    }

    //* percent % case
    else if (ch == '%') {
      double temp = double.parse(postFix.removeLast());
      temp /= 100;
      postFix.add(temp.toString());
    }

    //* case 4: operator
    else if (precedence.containsKey(ch)) {
      if (postFix.isEmpty && (ch == '+' || ch == '-')) {
        firstOperandSign = ch;
      } else {
        while (!op.isEmpty() &&
            precedence.containsKey(op.peek()!) &&
            precedence[ch]! <= precedence[op.peek()!]! &&
            op.peek() != '(') {
          postFix.add(op.pop()!);
        }
        op.push(ch);
      }
    }

    i++;
  }

  while (!op.isEmpty()) {
    postFix.add(op.pop()!);
  }

  return postFix;
}

void solve(custom_stack.Stack<double> s, String optr) {
  double top1 = s.pop()!;
  double top2 = s.pop()!;

  if (optr == "+") {
    s.push(top2 + top1);
  } else if (optr == "-") {
    s.push(top2 - top1);
  } else if (optr == "*") {
    s.push(top2 * top1);
  } else if (optr == "÷") {
    s.push(top2 / top1);
  } else if (optr == "^") {
    s.push(pow(top2, top1).toDouble());
  }
}

String? getResult(String expression) {
  String tempExp = expression;

  //* add * where it is not present
  tempExp = addAsterisk(tempExp);

  List<String> postFix = getPostFix(tempExp);

  var s = custom_stack.Stack<double>();

  for (String token in postFix) {
    if (['+', '-', '*', '÷', '^'].contains(token)) {
      solve(s, token);
    } else {
      s.push(double.parse(token));
    }
  }

  if (s.size() != 1) {
    return 'Invalid Operation';
  }

  return s.peek()?.toStringAsFixed(4);
}
