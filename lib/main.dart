import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

main() => runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      // '/': (context) => Loading(),
      '/location': (context) => ChooseLocation(),
      '/home': (context) => Home(),
      '/loading': (context) => Loading()
    },
    theme: ThemeData(brightness: Brightness.dark),
    home: Home()));
