class Stack<T> {
  final List<T> _stack = [];

  // Push element onto the stack
  void push(T element) {
    _stack.add(element);
  }

  // Pop element from the stack
  T? pop() {
    if (_stack.isEmpty) {
      return null;
    }
    return _stack.removeLast();
  }

  // Peek at the top element of the stack without removing it
  T? peek() {
    if (_stack.isEmpty) {
      return null;
    }
    return _stack.last;
  }

  // Check if the stack is empty
  bool isEmpty() {
    return _stack.isEmpty;
  }

  // Get the size of the stack
  int size() {
    return _stack.length;
  }

}