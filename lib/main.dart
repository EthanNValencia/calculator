// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
import 'display.dart';
import 'buttonpanel.dart';
import 'header.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState(); // Private class is easily identifiable
  }
}

class _MyAppState extends State<MyApp> {
  String _text = '';
  String _recentInput = '';
  String _recentParenthesis = '';
  String _previousText = '';

  void _clickButton(String textDisplay) {
    setState(() {
      try {
      if (_text.isNotEmpty) {
        String last = _text[_text.length - 1];
        if (double.tryParse(last) == null) {
          _text.substring(0, _text.length - 1);
          _text += textDisplay;
          _recentInput = textDisplay;
        } else if (double.tryParse(last) != null) {
          if (_text.length <= 20) {
            _recentInput = textDisplay;
            _text += textDisplay;
          }
        }
      } else if (_text.isEmpty) {
        if (double.tryParse(textDisplay) != null || textDisplay == '(') {
          _text = textDisplay;
        }
      }
      } catch (Exception){
        print("Something went wrong.");
      }
    });
  }

  bool _equalsOperator(String recentInput, String lastInput){ // Compare recent and last input with each other determine if operator should be overwritten.
    if(recentInput == lastInput){
      return true;
    }
    /// if(latestInput == )
    return false;
  }

  void _equalsButton(String textDisplay) {
    setState(() {
      try {
      _text = _text + _finishParenthesis();
      _text = _fixEquation(_text);
      _previousText = _text;
      _text = _text.interpret().toString();
      _previousText = _previousText + ' = ' + _text;
      } catch (Exception){
        _text = '';
        _previousText = '';
      }
    });
  }

  String _finishParenthesis() {
    if (_recentParenthesis == '(') {
      return ')';
    }
    return '';
  }

  String _fixEquation(String equation) {
    String result = equation;
    RegExp reg = RegExp(r'[0-9]+[(]');
    Iterable<RegExpMatch> allMatches = reg.allMatches(result);
    if (allMatches.isNotEmpty) {
      for (int i = 0; i < allMatches.length; i++) {
        RegExpMatch match = allMatches.elementAt(i);
        String matchString = match.group(0).toString();
        matchString = matchString.replaceAll("(", "*(");
        result = result.replaceAll(match.group(0).toString(), matchString);
      }
    }
    return result;
  }

  void _resetDisplay() {
    setState(() {
      _text = '';
      _recentParenthesis = '';
    });
  }

  void _remove() {
    setState(() {
      if (_text.isNotEmpty) {
        var newString = _text.substring(_text.length - 1);
        print(newString);
        if (newString == '(') {
          _recentParenthesis = ')';
        } else if (newString == ')') {
          _recentParenthesis = '(';
        }
        _text = _text.substring(0, _text.length - 1);
      }
    });
  }

  void _parenthesis() {
    setState(() {
      if (_recentParenthesis == ('(')) {
        _text = _text + ')';
        _recentParenthesis = ')';
      } else {
        _text = _text + '(';
        _recentParenthesis = '(';
      }
    });
  }

  void _clearAll() {
    _resetDisplay();
    setState(() {
      _previousText = '';
    });
  }

  final List<List<String>> _buttons = const [
    ['7', '8', '9', '+'],
    ['4', '5', '6', '-'],
    ['1', '2', '3', '*'],
    ['0', '.', '^', '/'],
    ['=', '()', '<-', 'AC'],
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Header(),
          // title: Image.asset('images/Nephew2.1Trans.png', fit: BoxFit.cover),
          backgroundColor: Colors.red[800],
          shadowColor: Colors.redAccent,
        ),
        body: Center(
          child: Column(
            children: [
              Display(_text),
              Display(_previousText),
              Expanded(child: Container()),
              ButtonPanel(
                displayText: _text,
                equals: _equalsButton,
                clear: _resetDisplay,
                clickButton: _clickButton,
                buttons: _buttons,
                remove: _remove,
                parenthesis: _parenthesis,
                clearAll: _clearAll,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.red[300],
      ),
    );
  }
}

// Ex: Scaffold(ctrl+space) to see named arguments for Scaffold