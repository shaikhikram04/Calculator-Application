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
  while (i < expression.length) {
    String ch = expression[i];

    //* case 1: number (0 - 9)
    if (isDigit(ch) || ch == '.') {
      String temp = '';
      while (i < expression.length &&
          (isDigit(expression[i]) || expression[i] == '.')) {
        temp += expression[i++];
      }
      postFix.add(temp);

      continue;
    }

    //* case 2 : close braces )
    else if (ch == ')') {
      while (!op.isEmpty() && op.peek() != '(') {
        postFix.add(op.pop()!);
      }
      op.pop();
    }

    //* percent % case
    else if (ch == '%') {
      double temp = double.parse(postFix.removeLast());
      temp /= 100;
      postFix.add(temp.toString());
    }

    //* case 3: lower or equal precedence
    else if (op.isEmpty() ||
        (precedence.containsKey(op.peek()!) &&
            precedence[ch]! <= precedence[op.peek()!]!)) {
      while (!op.isEmpty() &&
          precedence.containsKey(op.peek()!) &&
          precedence[ch]! <= precedence[op.peek()!]! &&
          op.peek() != '(') {
        postFix.add(op.pop()!);
      }
      op.push(ch);
    }

    //* case 4 : higher precedence
    else {
      op.push(ch);
    }

    i++;
  }

  while (!op.isEmpty()) {
    postFix.add(op.pop()!);
  }

  return postFix;
}

void solve(custom_stack.Stack<double> s, String optr) {
  double top = s.pop()!;

  if (optr == "+") {
    double temp = s.pop()! + top;
    s.push(temp);
  } else if (optr == "-") {
    double temp = s.pop()! - top;
    s.push(temp);
  } else if (optr == "*") {
    double temp = s.pop()! * top;
    s.push(temp);
  } else if (optr == "÷") {
    double temp = s.pop()! / top;
    s.push(temp);
  } else if (optr == "^") {
    double temp = pow(s.pop()!, top).toDouble();
    s.push(temp);
  }
}

String? getResult(String expression) {
  String tempExp = expression;

  //* add * where it is not present
  tempExp = addAsterisk(tempExp);

  //* convert into postFix
  List<String> postFix = getPostFix(tempExp);

  var s = custom_stack.Stack<double>();
  s.push(double.parse(postFix[0]));
  for (int i = 1; i < postFix.length && !s.isEmpty(); i++) {
    String op = postFix[i];
    if (op == "+" || op == "-" || op == "*" || op == "÷" || op == "^") {
      solve(s, op);
    } else {
      s.push(double.parse(op));
    }
  }

  if (s.size() != 1) {
    return 'Invalid Operation';
  }

  return s.peek()?.toStringAsFixed(4);
}
