import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'final_score_widget.g.dart';

@swidget
Widget _finalScore(
  BuildContext context, {
  required int score,
  required Duration duration,
  required double distance,
}) {
  return Container(
    padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
    alignment: Alignment.topCenter,
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            'Score: $score',
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            'Time: ${duration.inSeconds} seconds',
            style: const TextStyle(fontSize: 15),
          ),
        ),
        // const Spacer(),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            'Distance ${distance.toInt()} m',
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ],
    ),
  );
}
