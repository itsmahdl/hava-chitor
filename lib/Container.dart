import 'package:flutter/material.dart';


// ignore: must_be_immutable
class Containerr extends StatelessWidget {


  Containerr(this.icon, this.time, this.temp, this.firstColor, this.secondColor);

  var time;
  var firstColor;
  var secondColor;
  var temp;
  var icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: icon),
        Expanded(
          child: Text(time.data.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20)),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: Text(temp != null ?
              temp.data.toString() : 'Loading',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 30)),
        ),
      ]),
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [firstColor, secondColor],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
    );
  }
}
