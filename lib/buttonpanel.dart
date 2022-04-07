// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'button.dart';

class ButtonPanel extends StatelessWidget {
  final List<List<String>> buttons;
  final Function clickButton, equals;
  final VoidCallback clear, remove, parenthesis, clearAll;
  final String displayText;

  const ButtonPanel({
    required this.displayText,
    required this.buttons,
    required this.clickButton,
    required this.clear,
    required this.equals,
    required this.remove,
    required this.parenthesis,
    required this.clearAll,
  });

  Widget getRow(List<String> strings) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: strings
            .map((item) => Button(item, () => clickButton(item), () => equals(displayText), clear, remove, parenthesis, clearAll))
            .toList());
  }

  @override
  Column build(BuildContext context) {
    return Column(
      children: [
        for (List<String> item in buttons) getRow(item),
      ],
    );
  }
}
