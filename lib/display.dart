import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String buttonText;

  const Display(this.buttonText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Tooltip(
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 28, color: Colors.white),
            textAlign: TextAlign.right,
          ),
          message: ''),
    );
  }
}
