// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class WeatherMainPage extends StatelessWidget {
  const WeatherMainPage({super.key});

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
            TownWeatherCard(id: 0),
            TownWeatherCard(id: 1),
            TownWeatherCard(id: 2),
            TownWeatherCard(id: 3),
          ],
        ),
      ),
    );
  }
}

class TownWeatherCard extends StatelessWidget {
  final int id;

  const TownWeatherCard({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<List<Color>> gradients = [
      [
        Color.fromARGB(255, 85, 85, 124),
        Color.fromARGB(255, 48, 64, 94),
      ],
      [
        Color.fromARGB(255, 131, 59, 255),
        Color.fromARGB(255, 52, 29, 86),
      ],
      [
        Color.fromARGB(255, 254, 229, 66),
        Color.fromARGB(255, 243, 174, 0),
      ],
      [
        Color.fromARGB(255, 104, 207, 255),
        Color.fromARGB(255, 33, 93, 204),
      ],
    ];

    final List<String> cities = [
      'My Location',
      'London',
      'Istanbul',
      'Nuuk',
    ];

    final List<String> descs = [
      'Rainy',
      'Partly Cloudy',
      'Sunny',
      'Snowy',
    ];

    final List<String> temps = [
      '13°',
      '17°',
      '24°',
      '-6°',
    ];

    final List<String> iconPaths = [
      'assets/images/icon_rainy.png',
      'assets/images/icon_night.png',
      'assets/images/icon_sun.png',
      'assets/images/icon_air.png',
    ];

    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: gradients[id],
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
                descs[id],
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                temps[id],
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
            iconPaths[id],
            scale: 1.5,
          ),
        ],
      ),
    );
  }
}
