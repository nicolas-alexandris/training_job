import 'package:flutter/material.dart';
import 'package:training_job/weather/weather_welcome_page.dart';
import 'package:weather/weather.dart';

WeatherFactory wf = WeatherFactory("f8afd8e0e12c3d1f5e176ffea1cb5959");

void main() {
  runApp(const MaterialApp(
    home: WeatherWelcomePage(),
  ));
}
