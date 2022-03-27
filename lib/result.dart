import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;
  final String score;

  Result(this.resultScore, this.resetHandler, this.score);

  String get resultPhrase {
    String resultText = '';
    if (resultScore == 4) {
      resultText = 'You did great! Perfect score!';
    } else if (resultScore == 3) {
      resultText = 'You did okay.';
    } else if (resultScore == 2) {
      resultText = 'You didn\'t do well.';
    } else {
      resultText = 'You did bad. You really need to study.';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            resultPhrase,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          'Final Score: ' + score,
          style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        TextButton(
          onPressed: resetHandler,
          child: const Text('Restart Quiz'),
        )
      ],
    ));
  }
}
