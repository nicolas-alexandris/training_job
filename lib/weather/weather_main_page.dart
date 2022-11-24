// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:training_job/weather/weather_town_page.dart';
import 'package:weather/weather.dart';

import '../main.dart';

enum WeatherCondition {
  rainy(
    'Rainy',
    [
      Color.fromARGB(255, 85, 85, 124),
      Color.fromARGB(255, 48, 64, 94),
    ],
    'assets/images/icon_rainy.png',
  ),
  nighty(
    'Night',
    [
      Color.fromARGB(255, 131, 59, 255),
      Color.fromARGB(255, 52, 29, 86),
    ],
    'assets/images/icon_night.png',
  ),
  sunny(
    'Sunny',
    [
      Color.fromARGB(255, 254, 229, 66),
      Color.fromARGB(255, 243, 174, 0),
    ],
    'assets/images/icon_sun.png',
  ),
  air(
    'Air',
    [
      Color.fromARGB(255, 104, 207, 255),
      Color.fromARGB(255, 33, 93, 204),
    ],
    'assets/images/icon_air.png',
  );

  const WeatherCondition(this.desc, this.gradient, this.iconPath);

  final String desc;
  final List<Color> gradient;
  final String iconPath;
}

final List<String> cities = [
  'Greece',
  'London',
  'Istanbul',
  'Nuuk',
  'New York',
  'Tokyo',
  'Sydney',
];

class WeatherMainPage extends StatefulWidget {
  const WeatherMainPage({super.key});

  @override
  State<WeatherMainPage> createState() => _WeatherMainPageState();
}

class _WeatherMainPageState extends State<WeatherMainPage> {
  final List<String> cityDescs = [];

  final List<String> cityTemps = [];

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  Future getWeather() async {
    for (int i = 0; i < cities.length; i++) {
      Weather w = await wf.currentWeatherByCityName(cities[i]);
      String? desc = w.weatherMain;
      String? temp = w.temperature?.celsius?.toStringAsFixed(1);

      desc ??= 'N/A';
      temp ??= 'N/A';

      cityDescs.add(desc);
      cityTemps.add(temp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 80, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Weather',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.more_horiz,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search for a city',
                  hintStyle: TextStyle(
                    color: Colors.black45,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black45,
                  ),
                ),
              ),
            ),
            FutureBuilder(
              future: getWeather(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(5),
                    itemCount: cities.length,
                    itemBuilder: (context, index) {
                      WeatherCondition cond;
                      if (cityDescs[index] == 'Rain') {
                        cond = WeatherCondition.rainy;
                      } else if (cityDescs[index] == 'Clear') {
                        cond = WeatherCondition.sunny;
                      } else if (cityDescs[index] == 'Clouds') {
                        cond = WeatherCondition.air;
                      } else {
                        cond = WeatherCondition.nighty;
                      }
                      return townWeatherCard(index, cond);
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  townWeatherCard(int id, WeatherCondition condition) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WeatherTownPage(townName: cities[id]),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: condition.gradient,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cities[id],
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  cityDescs[id],
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  '${cityTemps[id]}°C',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Spacer(),
            Image.asset(
              condition.iconPath,
              scale: 1.5,
            ),
          ],
        ),
      ),
    );
  }
}
