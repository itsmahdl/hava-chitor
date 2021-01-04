import 'package:flutter/material.dart';

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.inCaps).join(" ");
}

// ignore: must_be_immutable
class Carousel extends StatelessWidget {
  var weatherCondition;
 setImage () {
    if (weatherCondition=='Mist') {
      return 'asset/images/Mist.jpg';
    }
    else if (weatherCondition=='Clear') {
      return 'asset/images/Clear.jpg';
    }
    else if (weatherCondition=='Clouds') {
      return 'asset/images/Clouds.jpg';
    }
    else if (weatherCondition=='Snow') {
      return 'asset/images/Snow.jpg';
    }
    else if (weatherCondition=='Rain') {
      return 'asset/images/Rain.jpg';
    }
    else if (weatherCondition=='Drizzle') {
      return 'asset/images/Drizzle.jpg';
    }
    else if (weatherCondition=='Thunderstorm') {
      return 'asset/images/Thunderstorm.jpg';
    }
    else if (weatherCondition=='Haze') {
      return 'asset/images/Mist.jpg';
    }
    else if (weatherCondition=='Smoke') {
      return 'asset/images/Mist.jpg';
    }
    else if (weatherCondition=='Dust') {
      return 'asset/images/Mist.jpg';
    }
    else if (weatherCondition=='Fog') {
      return 'asset/images/Mist.jpg';
    }
    else if (weatherCondition=='Sand') {
      return 'asset/images/Mist.jpg';
    }
    else if (weatherCondition=='Ash') {
      return 'asset/images/Mist.jpg';
    }
    else if (weatherCondition=='Squall') {
      return 'asset/images/Mist.jpg';
    }
    else if (weatherCondition=='Tornado') {
      return 'asset/images/Mist.jpg';
    }
    else if (weatherCondition == null) {
      return 'asset/images/Mist.jpg';
    }
  }
  final namee;
  Carousel(this.namee, this.weatherCondition);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(setImage()), fit: BoxFit.fitWidth),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 5,
                blurRadius: 10,
              )
            ],
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Center(
            child: Text(
                namee != null
                    ? namee.toString().capitalizeFirstofEach
                    : 'Loading',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 30)),
          ),
          width: double.infinity,
          height: 200,
        ));
  }
}
