import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  setupWorldTime() async {
    WorldTime worldTime = WorldTime(
        flag: 'germany.png', location: 'Germany', url: 'America/Montevideo');
    await worldTime.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'flag': worldTime.flag,
      'location': worldTime.location,
      'url': worldTime.url,
      'time': worldTime.time,
      'isDayTime': worldTime.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SpinKitDoubleBounce(
        color: Colors.cyan[600],
        size: 78,
      ),
    ));
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
}
