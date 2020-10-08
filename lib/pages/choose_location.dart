import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a location'),
      ),
      body: Center(
        child: RaisedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/loading');
            },
            icon: Icon(Icons.cake),
            label: Text('Clique o cão')),
      ),
    );
  }
}
