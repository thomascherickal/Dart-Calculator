import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _display = '';
  double _result = 0;
  double _firstOperand = 0;
  double _secondOperand = 0;
  String _operator = '';

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _display = '';
        _result = 0;
        _firstOperand = 0;
        _secondOperand = 0;
        _operator = '';
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '*' ||
          buttonText == '/') {
        _firstOperand = double.parse(_display);
        _operator = buttonText;
        _display = '';
      } else if (buttonText == '=') {
        _secondOperand = double.parse(_display);
        if (_operator == '+') {
          _result = _firstOperand + _secondOperand;
        } else if (_operator == '-') {
          _result = _firstOperand - _secondOperand;
        } else if (_operator == '*') {
          _result = _firstOperand * _secondOperand;
        } else if (_operator == '/') {
          _result = _firstOperand / _secondOperand;
        }
        _display = _result.toString();
        _firstOperand = _result;
        _operator = '';
      } else {
        _display += buttonText;
      }
    });
  }

  Widget _buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
          side: BorderSide(
            color: Colors.white,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        onPressed: () => _buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              _display,
              style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  _buildButton('7', 1, Colors.black54),
                  _buildButton('8', 1, Colors.black54),
                  _buildButton('9', 1, Colors.black54),
                  _buildButton('/', 1, Colors.blue),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton('4', 1, Colors.black54),
                  _buildButton('5', 1, Colors.black54),
                  _buildButton('6', 1, Colors.black54),
                  _buildButton('*', 1, Colors.blue),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton('1', 1, Colors.black54),
                  _buildButton('2', 1, Colors.black54),
                  _buildButton('3', 1, Colors.black54),
                  _buildButton('-', 1, Colors.blue),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton('C', 1, Colors.red),
                  _buildButton('0', 1, Colors.black54),
                  _buildButton('=', 1, Colors.blue),
                  _buildButton('+', 1, Colors.blue),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
