import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    var bgImage = data['isDayTime'] ? 'assets/day.png' : 'assets/night.png';

    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(bgImage),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              RaisedButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag']
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text('Edit Location')),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectableText(
                    data['location'],
                    style: TextStyle(fontSize: 28, letterSpacing: 2),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(data['time'],
                  style: TextStyle(
                    fontSize: 66,
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
