// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
import 'display.dart';
import 'panel.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState(); // Private class is easily identifiable
  }
}

class _MyAppState extends State<MyApp> {
  String _text = '';
  String _recentParenthesis = '';
  String _previousText = '';

  void _clickButton(String textDisplay) {
    setState(() {
      _text += textDisplay;
    });
  }

  void _equalsButton(String textDisplay) {
    setState(() {
      _previousText = _text;
      _text = _text.interpret().toString();
      _previousText = _previousText + ' = ' + _text;
    });
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
        if(newString == '('){
          _recentParenthesis = ')';
        } else if (newString == ')'){
          _recentParenthesis = '(';
        }
        _text = _text.substring(0, _text.length - 1);
      }
    });
  }

  void _parenthesis(){
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

  /*
  7 8 9 +
  4 5 6 -
  1 2 3 *
  0 . = /
  */
  final List<List<String>> _buttons = const [
    ['7',
    '8',
    '9',
    '+'],
    ['4',
    '5',
    '6',
    '-'],
    ['1',
    '2',
    '3',
    '*'],
    ['0',
    '.',
    '^',
    '/'],
    ['=',
    '()',
    '<-',
    'AC'],
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
          backgroundColor: Colors.grey,
          shadowColor: Colors.redAccent,
        ),
        body: Center(
          child: Column(
            children: [
              Display(_text),
              Display(_previousText),
              Expanded(child:Container()),
              Panel(displayText: _text, equals: _equalsButton, clear: _resetDisplay, clickButton: _clickButton, buttons: _buttons, remove: _remove, parenthesis: _parenthesis,),
            ],
          ),
        ),
        backgroundColor: Colors.brown,
      ),
    );
  }
}

// Ex: Scaffold(ctrl+space) to see named arguments for Scaffold