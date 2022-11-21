// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:animate_gradient/animate_gradient.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WeatherWelcomePage extends StatefulWidget {
  const WeatherWelcomePage({super.key});

  @override
  State<WeatherWelcomePage> createState() => _WeatherWelcomePageState();
}

class _WeatherWelcomePageState extends State<WeatherWelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AnimateGradient(
        primaryBegin: Alignment.topLeft,
        primaryEnd: Alignment.bottomLeft,
        secondaryBegin: Alignment.bottomLeft,
        secondaryEnd: Alignment.topRight,
        primaryColors: [
          Color.fromARGB(255, 128, 39, 176),
          Colors.lightBlue,
          Colors.yellow,
        ],
        secondaryColors: [
          Colors.white,
          Colors.blueAccent,
          Colors.blue,
        ],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Image.asset(
                'assets/images/icon_rainy.png',
                scale: .8,
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.all(30),
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Column(
                  children: [
                    AnimatedSmoothIndicator(
                      activeIndex: 1,
                      count: 3,
                      effect: JumpingDotEffect(
                        activeDotColor: Colors.blue,
                        dotColor: Color.fromARGB(255, 200, 194, 194),
                        dotWidth: 14,
                        dotHeight: 14,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Weather App',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Discover the weather in your city and plan your day correctly',
                      style: TextStyle(
                        fontSize: 21,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 85,
                          width: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            border: Border.all(
                              width: 2,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromARGB(255, 150, 227, 255),
                                Color.fromARGB(255, 21, 110, 183),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 45,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
