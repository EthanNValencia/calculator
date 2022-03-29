import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final VoidCallback registerClick, clear, remove, equals, parenthesis;
  final String name;
  // ignore: use_key_in_widget_constructors
  const Button(this.name, this.registerClick, this.equals, this.clear,
      this.remove, this.parenthesis);

  bool isNumber(var value) {
    if (value == null) {
      return false;
    }
    return double.tryParse(value) != null;
  }

  Color? _getColor() {
    if (isNumber(name)) {
      return Colors.red[800];
    } else {
      return Colors.grey;
    }
  }

  MaterialColor _getShadow() {
    if (isNumber(name)) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

  VoidCallback _getFunction() {
    if (name != '=' && name != '<-' && name != 'AC' && name != '()') {
      return registerClick;
    }
    if (name == '=') {
      return equals;
    } else if (name == '<-') {
      return remove;
    } else if (name == 'AC') {
      return clear;
    } else if (name == '()') {
      return parenthesis;
    }
    throw Exception('Button $name is missing a function.');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * 0.20,
      height: MediaQuery.of(context).size.height * 0.10,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: _getColor(),
            shadowColor: _getShadow(),
            shape: const CircleBorder(),
          ),
          child: Text(
            name,
            style: const TextStyle(fontSize: 25),
          ),
          onPressed: _getFunction(),
        ),
      
    );
  }
}
