import 'package:flutter/material.dart';
import 'package:iyax_weather_app/pages/choose_location.dart';
import 'package:iyax_weather_app/pages/loading.dart';
import 'package:iyax_weather_app/pages/home.dart';


void main()=>runApp(MaterialApp(
  routes: {
    '/': (context)=> Loading(),
    '/home': (context)=> Home(),
    '/location': (context)=> ChooseLocation(),
  },
));