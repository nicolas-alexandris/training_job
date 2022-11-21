import 'package:flutter/material.dart';
import 'package:training_job/Job/job_main_page.dart';
import 'package:training_job/job/job_single_page.dart';
import 'package:training_job/job/job_tutorial_page.dart';
import 'package:training_job/weather/weather_main_page.dart';
import 'package:training_job/weather/weather_town_page.dart';
import 'package:training_job/weather/weather_welcome_page.dart';

void main() {
  runApp(const MaterialApp(
    home: WeatherTownPage(),
  ));
}
