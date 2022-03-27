import 'package:calculator/display.dart';
import 'package:flutter/material.dart';
import 'button.dart';

class Panel extends StatelessWidget {
  final List<List<String>> buttons;
  final Function clickButton, equals;
  final VoidCallback clear, remove;
  final String displayText;

  Panel({
    required this.displayText,
    required this.buttons,
    required this.clickButton,
    required this.clear,
    required this.equals,
    required this.remove,
  });

  Widget getRow(List<String> strings) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: strings
            .map((item) => Button(item, () => clickButton(item), () => equals(displayText), clear, remove))
            .toList());
            // const Button(this.name, this.registerClick, this.equals, this.clear, this.delete);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Display(displayText),
        for (List<String> item in buttons) getRow(item),
        ElevatedButton(onPressed: clear, child: const Text('Clear'))
      ],
    );
  }
}
