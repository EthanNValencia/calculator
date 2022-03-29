import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Align(
              // alignment: Alignment.topLeft,
              child: Text(
                'Calculator',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Align(
              // alignment: Alignment.bottomLeft,
              child: Text(
                'Nephew Software Solutions',
                style: TextStyle(fontSize: 11.5),
              ),
            ),
          ],
        ),
        const Text(
          'IMAGE HERE',
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
