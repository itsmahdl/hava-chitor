import 'package:flutter/material.dart';
import 'Container.dart';

// ignore: must_be_immutable
class DailyForeCast extends StatelessWidget {
  var time;
  var firstColor;
  var secondColor;
  final tempForecast;
  var icon;
  DailyForeCast(this.icon, this.time, this.tempForecast, this.firstColor,
      this.secondColor);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(25, 5, 25, 10),
        child: Column(children: [
          Containerr(icon, time, tempForecast, firstColor, secondColor),
        ]));
  }
}
