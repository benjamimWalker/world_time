import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  setupWorldTime() async {
    WorldTime worldTime = WorldTime(
        flag: 'germany.png', location: 'Germany', url: 'European/Germany');
    await worldTime.getTime();
    print(worldTime.time);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('Loading Screen')),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
