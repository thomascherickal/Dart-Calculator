class Calculation {
  List<String> a = [];

  void add(String added) {
    a.add(added);
  }

  void clearOne() {
    a.removeLast();
  }

  void clearAll() {
    a.clear();
  }

  String calculator() {
    if (a.length == 3) {
      double num1 = double.parse(a[0]);
      double num2 = double.parse(a[2]);
      switch (a[1]) {
        case '+':
          {
            return (num1 + num2).toString();
          }
        case '-':
          {
            return (num1 - num2).toString();
          }
        case '*':
          {
            return (num1 * num2).toString();
          }
        case '/':
          {
            return (num1 / num2).toString();
          }
      }
    }
    return '0';
  }

  String getString() {
    String out = '';

    for (int i = 0; i < a.length; i++) {
      out += a[i];
    }
    return out;
  }
}
