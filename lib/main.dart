import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hava_chitor/FirstPageCarousel.dart';
import 'package:hava_chitor/FirstPageUnderCarousel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hava_chitor/SecondPage.dart';
import 'package:intl/intl.dart';
import 'package:hava_chitor/ThirdPage.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var temp;
  var name;
  var humidity;
  var feelsLike;
  var description;
  var hourlyTemp;
  var dailyTemp;
  var city = 'Qazvin';
  var lat = 36.2737;
  var long = 49.9982;
  final controller = TextEditingController();
  final pageController = PageController();
  nextPage() {
    pageController.animateToPage(pageController.page.toInt() + 1,
        duration: Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  previousPage() {
    pageController.animateToPage(pageController.page.toInt() - 1,
        duration: Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  Widget hourly(index) {
    return Text(hourlyTemp != null
        ? hourlyTemp[index]['temp'].toStringAsFixed(1) + '\u00B0'
        : 'Loading');
  }

  Widget daily(index) {
    return Text(dailyTemp != null
        ? dailyTemp[index]['temp']['max'].toStringAsFixed(1) +
            '\u00B0' +
            '/' +
            dailyTemp[index]['temp']['min'].toStringAsFixed(1) +
            '\u00B0'
        : 'Loading');
  }

  Widget weatherIconHourly(index) {
    return Image.network(
      hourlyTemp != null
          ? 'http://openweathermap.org/img/wn/' +
              hourlyTemp[index]['weather'][0]['icon'].toString() +
              '@2x' +
              '.png'
          : 'http://openweathermap.org/img/wn/01d@2x.png',
      height: 70,
    );
  }

  Widget weatherIconDaily(index) {
    return Image.network(
      dailyTemp != null
          ? 'http://openweathermap.org/img/wn/' +
              dailyTemp[index]['weather'][0]['icon'].toString() +
              '@2x' +
              '.png'
          : 'http://openweathermap.org/img/wn/01d@2x.png',
      height: 70,
    );
  }

  var now = DateTime.now();
  hoursFromNow(index) {
    return Text(DateFormat.j().format(now.add(Duration(hours: index))));
  }

  daysFromNow(index) {
    return Text(DateFormat.E().format(now.add(Duration(days: index))));
  }

  openPopUp(context) {
    return Alert(
      context: context,
      style: AlertStyle(
          backgroundColor: Color(0xff272938),
          titleStyle: TextStyle(color: Colors.white),
          isOverlayTapDismiss: true,
          alertBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(
                color: Color(0xff272938),
              ))),
      title: 'Where',
      content: TextField(
        style: TextStyle(color: Colors.white),
        maxLines: 1,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        autofocus: true,
        controller: controller,
        onSubmitted: (String value) {
          city = controller.text;
          getAddress();
          getWeather();
          setState(() {
            getWeather();
            getAddress();
          });
        },
      ),
      buttons: [
        DialogButton(
          color: Color(0xff272938),
          onPressed: () {
            Navigator.pop(context);
            city = controller.text;
            getAddress();
            getWeather();
            controller.clear();
          },
          child: Text(
            "Submit",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    ).show();
  }

  var nameOfCity;
  getAddress() async {
    List<Location> locations = await locationFromAddress(city);
    setState(() {
      this.lat = locations[0].latitude;
      this.long = locations[0].longitude;
    });
    nameOfCity = await placemarkFromCoordinates(this.lat, this.long);
  }

  Future getWeather() async {
    http.Response response = await http.get(
        "http://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$long&units=metric&exclude=alerts&appid=5ae7e58b97415a037f498b1ad2a9ff51");
    var results = jsonDecode(response.body);
    setState(() {
      this.name = results['timezone'];
      this.temp = results['current']['temp'];
      this.feelsLike = results['current']['feels_like'];
      this.humidity = results['current']['humidity'];
      this.description = results['current']['weather'][0]['main'];
      this.hourlyTemp = results['hourly'];
      this.dailyTemp = results['daily'];
    });
  }

  @override
  void initState() {
    super.initState();
    this.getWeather();
    this.getAddress();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hava Chitor?',
      theme: ThemeData(
        accentColor: Color(0xff272938),
        primaryColor: Color(0xff272938),
        canvasColor: Color(0xff272938),
      ),
      home: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: GestureDetector(
                onTap: () {
                  openPopUp(context);
                },
                child: Icon(
                  Icons.add_circle_outline,
                  color: Colors.white,
                ),
              ),
            )
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'Hava Chitor?',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Sans',
                fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
        ),
        backgroundColor: Color(0xff272938),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0),
          child: PageView(
            children: [
              Column(
                children: [
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: [
                        Carousel(city, description),
                        UnderCarousel(temp, description, humidity, feelsLike),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.keyboard_arrow_down),
                    onPressed: nextPage,
                    color: Colors.white,
                    highlightColor: Color(0xff272938),
                    splashColor: Color(0xff272938),
                    focusColor: Color(0xff272938),
                  ),
                ],
              ),
              Column(children: [
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_up),
                  onPressed: previousPage,
                  color: Colors.white,
                  highlightColor: Color(0xff272938),
                  splashColor: Color(0xff272938),
                  focusColor: Color(0xff272938),
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      HourlyForecast(weatherIconHourly(1), hoursFromNow(1),
                          hourly(1), Color(0xFF6448FE), Color(0xFF5FC6FF)),
                      HourlyForecast(weatherIconHourly(2), hoursFromNow(2),
                          hourly(2), Color(0xFFFE6197), Color(0xFFFFB463)),
                      HourlyForecast(weatherIconHourly(3), hoursFromNow(3),
                          hourly(3), Color(0xFF61A3FE), Color(0xFF2980B9)),
                      HourlyForecast(weatherIconHourly(4), hoursFromNow(4),
                          hourly(4), Color(0xFFFFA738), Color(0xFFFFE130)),
                      HourlyForecast(weatherIconHourly(5), hoursFromNow(5),
                          hourly(5), Color(0xFFFF5DCD), Color(0xFFFF8484)),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_down),
                  onPressed: nextPage,
                  color: Colors.white,
                  highlightColor: Color(0xff272938),
                  splashColor: Color(0xff272938),
                  focusColor: Color(0xff272938),
                ),
              ]),
              Column(children: [
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_up),
                  onPressed: previousPage,
                  color: Colors.white,
                  highlightColor: Color(0xff272938),
                  splashColor: Color(0xff272938),
                  focusColor: Color(0xff272938),
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      DailyForeCast(weatherIconDaily(1), daysFromNow(1),
                          daily(1), Color(0xFFFFE000), Color(0xFF799F0C)),
                      DailyForeCast(weatherIconDaily(2), daysFromNow(2),
                          daily(2), Color(0xffc31432), Color(0xff240b36)),
                      DailyForeCast(weatherIconDaily(3), daysFromNow(3),
                          daily(3), Color(0xffDA4453), Color(0xff89216B)),
                      DailyForeCast(weatherIconDaily(4), daysFromNow(4),
                          daily(4), Color(0xff009FFF), Color(0xffec2F4B)),
                      DailyForeCast(weatherIconDaily(5), daysFromNow(5),
                          daily(5), Color(0xff3E5151), Color(0xffDECBA4))
                    ],
                  ),
                )
              ])
            ],
            controller: pageController,
            scrollDirection: Axis.vertical,
          ),
        ),
      ),
    );
  }
}
