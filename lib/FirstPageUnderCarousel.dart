import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UnderCarousel extends StatelessWidget {
  UnderCarousel(this.tempp, this.descriptionn, this.humidityy, this.feelsLike);

  final tempp;
  final humidityy;
  final descriptionn;
  final feelsLike;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 15, 25, 10),
          child: Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: FaIcon(
                    FontAwesomeIcons.pen,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text('Description',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Text(
                      descriptionn != null
                          ? descriptionn.toString()
                          : 'Loading',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 30)),
                )
              ],
            ),
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.red],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
          ),
        ), // END OF 1ST CONTAINER
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 5, 25, 10),
          child: Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: FaIcon(
                    FontAwesomeIcons.thermometerHalf,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text('Temperature',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Text(
                      tempp != null
                          ? tempp.toStringAsFixed(1) + '\u00B0'
                          : 'Loading',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 30)),
                )
              ],
            ),
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffADD100), Color(0xff7B920A)],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
          ),
        ), // END OF 2ND CONTAINER
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 5, 25, 10),
          child: Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: FaIcon(
                    FontAwesomeIcons.thermometerFull,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text('Feels Like',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Text(
                      feelsLike != null
                          ? feelsLike.toStringAsFixed(1) + '\u00B0'
                          : 'Loading',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 30)),
                )
              ],
            ),
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffaa4b6b),
                  Color(0xff6b6b83),
                  Color(0xff3b8d99)
                ],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
          ),
        ), //END OF 3RD CONTAINER
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 5, 25, 10),
          child: Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: FaIcon(
                    FontAwesomeIcons.water,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text('Humidity',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Text(
                      humidityy != null
                          ? humidityy.toString() + '%'
                          : 'Loading',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 30)),
                ),
              ],
            ),
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffad5389), Color(0xff3c1053)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
          ),
        ), // END OF 4TH CONTAINER
      ],
    );
  }
}
