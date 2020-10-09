import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('Loading Screen')),
    );
  }

  getTime() async {
    Response response =
        await get("http://worldtimeapi.org/api/timezone/Europe/London");
    var myMap = jsonDecode(response.body);

    //get properties from data
    var dateTime = myMap['datetime'];
    String offset = myMap['utc_offset'].substring(1);
    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }
}
