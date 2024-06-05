import 'dart:ffi';
import 'dart:math';

import 'package:calculator_application/custom_data_structure/stack.dart'
    as custom_stack;

bool isDigit(String str) {
  return str.length == 1 && str.compareTo('0') >= 0 && str.compareTo('9') <= 0;
}

void addAsterisk(String expression) {
  String temp = '';
  for (int i = 0; i < expression.length; i++) {
    if (expression[i] == '(' && isDigit(expression[i - 1])) {
      temp += '*';
    } else if (expression[i - 1] == ')' && isDigit(expression[i])) {
      temp += '*';
    }
    temp += expression[i];
  }
  expression = temp;
}

List<String> getPostFix(String expression) {
  List<String> postFix = [];
  var op = custom_stack.Stack<String>();
  Map<String, int> precedence = {};
  precedence['+'] = 1;
  precedence['-'] = 1;
  precedence['*'] = 2;
  precedence['/'] = 2;
  precedence['^'] = 3;
  precedence['('] = 4;

  int i = 0;
  while (i < expression.length) {
    String ch = expression[i];

    //* case 1: number (0 - 9)
    if (isDigit(ch) || ch == '.') {
      String temp = '';
      while (isDigit(expression[i]) || expression[i] == '.') {
        temp += expression[i++];
      }
      postFix.add(temp);

      if (i >= expression.length) {
        break;
      }

      ch = expression[i];
    }

    //* case : when stack is empty
    if (op.isEmpty()) {
      op.push(ch);
    }

    //* case 2 : close braces )
    else if (ch == ')') {
      while (op.peek() != '(') {
        String temp = '${op.peek()}';
        postFix.add(temp);

        op.pop();
      }
      op.pop();
    }

    //* case 3: lower or equal precedence
    else if (precedence[ch]! <= precedence[op.peek()]!) {
      // cout << "in case 3" << endl;
      while (!op.isEmpty() &&
          precedence[ch]! <= precedence[op.peek()]! &&
          op.peek() != '(') {
        String temp = '${op.peek()}';
        postFix.add(temp);

        op.pop();
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
    String temp = '${op.peek()}';
    postFix.add(temp);

    op.pop();
  }

  return postFix;
}

void solve(custom_stack.Stack<double> s, String optr) {
  double top = s.peek()!;
  s.pop();
  if (optr == "+") {
    double temp = s.peek()! + top;
    s.pop();
    s.push(temp);
  } else if (optr == "-") {
    double temp = s.peek()! - top;
    s.pop();
    s.push(temp);
  } else if (optr == "*") {
    double temp = s.peek()! * top;
    s.pop();
    s.push(temp);
  } else if (optr == "/") {
    double temp = s.peek()! / top;
    s.pop();
    s.push(temp);
  } else if (optr == "^") {
    double temp = pow(s.peek()!, top).toDouble();
    s.pop();
    s.push(temp);
  }
}

double getResult(String expression) {
  String tempExp = expression;

  //* add * where it is not present
  addAsterisk(tempExp);

  //* convert into postFix
  List<String> postFix = getPostFix(tempExp);

  var s = custom_stack.Stack<double>();

  for (int i = 0; i < postFix.length; i++) {
    String op = postFix[i];
    if (op == "+" || op == "-" || op == "*" || op == "/" || op == "^") {
      solve(s, op);
    } else {
      s.push(double.parse(op));
    }
  }
  return s.peek()!;
}
