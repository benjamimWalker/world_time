import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(brightness: Brightness.dark), home: Home());
  }
}
