import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  //location name for the UI
  String location;

  //The time in that location
  String time;

  //url for asset flag icon
  String flag;

  //the location url for api...
  String url;

  // If it will be showed (maybe) the night image nor xor sei lá the day light yagammmy image
  bool isDayTime;

  WorldTime({
    this.location,
    this.flag,
    this.url,
  });

  Future<void> getTime() async {
    try {
      Response response =
          await get("http://worldtimeapi.org/api/timezone/$url");
      var myMap = jsonDecode(response.body);

      //get properties from data
      var dateTime = myMap['datetime'];
      String offset = myMap['utc_offset'].substring(1, 3);
      DateTime now = DateTime.parse(dateTime);

      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime = now.hour > 6 && now.hour < 19;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('deu ruim ' + e.toString());
    }
  }
}
