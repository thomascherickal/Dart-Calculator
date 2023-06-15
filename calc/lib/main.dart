import 'package:flutter/material.dart';
import 'calculation.dart';

class ExpandedButton extends StatelessWidget {
  const ExpandedButton(
      {required this.onPressed,
      required this.child,
      required this.color,
      required Key key})
      : super(key: key);

  final Widget child;

  final VoidCallback onPressed;

  final Color color;

  Widget build(BuildContext buildcontext) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
        style: ElevatedButton.styleFrom(
            backgroundColor: color),
      ),
    );
  }
}

class ExpandedRow extends StatelessWidget {
  List<Widget> children;
  CrossAxisAlignment crossAxisAlignment;
  ExpandedRow({required this.children, required this.crossAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        children: children,
        crossAxisAlignment: crossAxisAlignment,
      ),
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
          primarySwatch: Colors.blue, backgroundColor: Colors.black26),
      home: CalculatorHomePage(
        title: 'Calculator',
        key: Key(
          "Flutter Calculator",
        ),
      ),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({required Key key, required this.title})
      : super(key: key);

  final String title;

  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _str = "0";
  var _calculate = Calculation();

  void add(String a) {
    setState(() {
      _calculate.add(a);
      _str = _calculate.getString();
    });
  }

  void deleteOne() {
    setState(() {
      _calculate.clearOne();
      _str = _calculate.getString();
    });
  }

  void deleteAll() {
    setState(() {
      _calculate.clearAll();
      _str = _calculate.getString();
    });
  }

  void getResult() {
    setState(() {
      _str = _calculate.calculator().toString();
    });
    _calculate = Calculation();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              child: Text(
                _str,
                style: const TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          ExpandedRow(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ExpandedButton(
                  onPressed: () => deleteAll(),
                  child: const Text("AC"),
                  color: Colors.grey,
                  key: const Key("AC")),
              ExpandedButton(
                  onPressed: () => deleteAll(),
                  child: const Text("C"),
                  color: Colors.grey,
                  key: const Key("C")),
              ExpandedButton(
                onPressed: () {
                  deleteOne();
                },
                child: const Text("<-"),
                color: Colors.grey,
                key: const Key("<-"),
              ),
              ExpandedButton(
                onPressed: () {
                  add("/");
                },
                child: const Text("/"),
                color: Colors.orange,
                key: const Key("/"),
              ),
            ],
          ),
          ExpandedRow(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ExpandedButton(
                  onPressed: () {
                    add("7");
                  },
                  child: const Text("7"),
                  color: Colors.black12,
                  key: const Key("7")),
              ExpandedButton(
                  onPressed: () {
                    add("8");
                  },
                  child: const Text("8"),
                  color: Colors.black12,
                  key: const Key("8")),
              ExpandedButton(
                  onPressed: () {
                    add("9");
                  },
                  child: const Text("9"),
                  color: Colors.black12,
                  key: const Key("9")),
              ExpandedButton(
                  onPressed: () {
                    add("*");
                  },
                  child: const Text("x"),
                  color: Colors.orange,
                  key: const Key("x")),
            ],
          ),
          ExpandedRow(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ExpandedButton(
                  onPressed: () {
                    add("4");
                  },
                  child: const Text("4"),
                  color: Colors.black12,
                  key: const Key("4")),
              ExpandedButton(
                  onPressed: () {
                    add("5");
                  },
                  child: const Text("5"),
                  color: Colors.black12,
                  key: const Key("5")),
              ExpandedButton(
                  onPressed: () {
                    add("6");
                  },
                  child: const Text("6"),
                  color: Colors.black12,
                  key: const Key("6")),
              ExpandedButton(
                  onPressed: () {
                    add("-");
                  },
                  child: const Text("-"),
                  color: Colors.orange,
                  key: const Key("-")),
            ],
          ),
          ExpandedRow(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ExpandedButton(
                  onPressed: () {
                    add("1");
                  },
                  child: const Text("1"),
                  color: Colors.black12,
                  key: const Key("1")),
              ExpandedButton(
                  onPressed: () {
                    add("2");
                  },
                  child: const Text("2"),
                  color: Colors.black12,
                  key: const Key("2")),
              ExpandedButton(
                  onPressed: () {
                    add("3");
                  },
                  child: const Text("3"),
                  color: Colors.black12,
                  key: const Key("3")),
              ExpandedButton(
                  onPressed: () {
                    add("+");
                  },
                  child: const Text("+"),
                  color: Colors.orange,
                  key: const Key("+")),
            ],
          ),
          ExpandedRow(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ExpandedButton(
                  onPressed: () {
                    add("0");
                  },
                  child: const Text("0"),
                  color: Colors.black12,
                  key: const Key("0")),
              ExpandedButton(
                  onPressed: () {
                    add("00");
                  },
                  child: const Text("00"),
                  color: Colors.black12,
                  key: const Key("00")),
              ExpandedButton(
                  onPressed: () {
                    add(".");
                  },
                  child: const Text("."),
                  color: Colors.black12,
                  key: const Key(".")),
              ExpandedButton(
                  onPressed: () {
                    getResult();
                  },
                  child: const Text("="),
                  color: Colors.orange,
                  key: const Key("=")),
            ],
          ),
        ],
      ),
    );
  }
}
