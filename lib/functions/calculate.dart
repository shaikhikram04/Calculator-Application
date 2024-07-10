import 'dart:math';

import 'package:calculator_application/custom_data_structure/stack.dart'
    as custom_stack;

bool isDigit(String str) {
  return str.length == 1 && str.compareTo('0') >= 0 && str.compareTo('9') <= 0;
}

bool isOperator(String ch) {
  return (ch == '+' ||
      ch == '-' ||
      ch == 'x' ||
      ch == '÷' ||
      ch == '^' ||
      ch == '%');
}

String addAsterisk(String expression) {
  String temp = '';
  for (int i = 0; i < expression.length; i++) {
    if (i > 0 && expression[i] == '(' && isDigit(expression[i - 1])) {
      temp += 'x';
    } else if (i > 0 && expression[i - 1] == ')' && isDigit(expression[i])) {
      temp += 'x';
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
    'x': 2,
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
        postFix.add(')');
        return postFix;
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

bool isInvalidOperaition(List<String> postFix) {
  if (postFix.contains('(') || postFix.contains(')')) {
    return true;
  }

  int noOfOperator = 0;
  int noOfNumber = 0;

  for (final element in postFix) {
    if (isOperator(element)) {
      noOfOperator++;
    } else {
      noOfNumber++;
    }
  }

  if (noOfNumber != noOfOperator + 1) {
    return true;
  }

  return false;
}

void solve(custom_stack.Stack<double> s, String optr) {
  double top1 = s.pop()!;
  double top2 = s.pop()!;

  if (optr == '+') {
    s.push(top2 + top1);
  } else if (optr == '-') {
    s.push(top2 - top1);
  } else if (optr == 'x') {
    s.push(top2 * top1);
  } else if (optr == '÷') {
    s.push(top2 / top1);
  } else if (optr == '^') {
    s.push(pow(top2, top1).toDouble());
  }
}

String removeTrailingZeros(String numStr) {
  //* Remove trailing zeros after the decimal point
  numStr = numStr.replaceFirst(RegExp(r'0*$'), '');
  //* Remove the decimal point if it is the last character
  numStr = numStr.replaceFirst(RegExp(r'\.$'), '');

  return numStr;
}

String getResult(String expression) {
  String tempExp = expression;

  //* add * where it is not present
  tempExp = addAsterisk(tempExp);

  //* get postfix of expression
  List<String> postFix = getPostFix(tempExp);

  //* Check for invalid operation
  if (isInvalidOperaition(postFix)) {
    return 'Invalid Operation';
  }

  var s = custom_stack.Stack<double>();

  for (String token in postFix) {
    if (isOperator(token)) {
      solve(s, token);
    } else {
      s.push(double.parse(token));
    }
  }

  String ans = s.peek()!.toStringAsFixed(4);

  return removeTrailingZeros(ans);
}
