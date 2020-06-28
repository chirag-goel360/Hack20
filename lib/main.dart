import 'dart:convert';

import 'package:farmerfame/Screens/CarbonFoot.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart' show radians;
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CarbonFootPrint(),
    debugShowCheckedModeBanner: false,
    );
  }
}

class RadialMenu extends StatefulWidget {
  createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 900), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return RadialAnimation(controller: controller);
  }
}

class RadialAnimation extends StatelessWidget {
  RadialAnimation({Key key, this.controller})
      : translation = Tween<double>(
          begin: 0.0,
          end: 100.0,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.linear),
        ),
        scale = Tween<double>(
          begin: 1.5,
          end: 0.0,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
        ),
        rotation = Tween<double>(
          begin: 0.0,
          end: 360.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.3,
              0.9,
              curve: Curves.decelerate,
            ),
          ),
        ),
        super(key: key);
  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> rotation;
  final Animation<double> translation;
  build(context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, builder) {
          return Transform.rotate(
            angle: radians(rotation.value),
            child: Stack(alignment: Alignment.center, children: [
              _buildButton(0, color: Colors.red, icon: FontAwesomeIcons.sun),
              _buildButton(60,
                  color: Colors.green, icon: FontAwesomeIcons.sprayCan),
              _buildButton(120,
                  color: Colors.orange, icon: FontAwesomeIcons.fire),
              _buildButton(180,
                  color: Colors.blue, icon: FontAwesomeIcons.kiwiBird),
              _buildButton(240,
                  color: Colors.black, icon: FontAwesomeIcons.cat),
              _buildButton(300,
                  color: Colors.indigo, icon: FontAwesomeIcons.paw),
              Transform.scale(
                scale: scale.value - 1.5,
                child: FloatingActionButton(
                    child: Icon(FontAwesomeIcons.timesCircle),
                    onPressed: _close,
                    backgroundColor: Colors.red),
              ),
              Transform.scale(
                scale: scale.value,
                child: FloatingActionButton(
                    child: Icon(FontAwesomeIcons.solidDotCircle),
                    onPressed: _open),
              )
            ]),
          );
        });
  }

  _open() {
    controller.forward();
  }

  _close() {
    controller.reverse();
  }

  _buildButton(double angle, {Color color, IconData icon}) {
    final double rad = radians(angle);
    return Transform(
        transform: Matrix4.identity()
          ..translate(
              (translation.value) * cos(rad), (translation.value) * sin(rad)),
        child: FloatingActionButton(
            child: Icon(icon),
            backgroundColor: color,
            onPressed: _close,
            elevation: 0));
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var temp;
  var description;
  var humidity;
  var wind;
  var currently;
  Future getData(double latitude, double longitude) async {
    String api = 'http://api.openweathermap.org/data/2.5/weather';
    String appId = 'db88d8a495a4e3fc4e181645da22796f';
    String url = '$api?lat=$latitude&lon=$longitude&appid=$appId';
    http.Response response = await http.get(url);
    var result = json.decode(response.body);
    setState(() {
      this.temp = result['main']['temp'];
      this.description = result['weather'][0]['description'];
      this.humidity = result['main']['humidity'];
      this.wind = result['wind']['speed'];
      this.currently = result['weather'][0]['main'];
    });
  }

  Future<Position> getPosition() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  @override
  void initState() {
    super.initState();
    getPosition().then((position) {
      getData(position.latitude, position.longitude);
    });
  }

  TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            color: Colors.purpleAccent.shade100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(1, 2),
                              blurRadius: 10)
                        ]),
                    child: ListTile(
                      leading: Icon(
                        Icons.search,
                        color: Colors.red,
                      ),
                      title: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                            hintText: 'Enter new location',
                            border: InputBorder.none),
                        onChanged: (String value) {
                          setState(() {});
                        },
                        onTap: () {
                          setState(() {
                            _controller.clear();
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Temperature Details",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                ),
                Text(
                  temp != null
                      ? '${(temp - 273.15).toStringAsFixed(3)}°C'
                      : "Loading",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "current Temperature of Area",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.thermometer),
                    title: Text('Temperature'),
                    trailing: Text(temp != null
                        ? '${(temp - 273.15).toStringAsFixed(3)}°C'
                        : "Loading"),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.sun),
                    title: Text('Humidity'),
                    trailing: Text(humidity != null
                        ? '${humidity.toString()}'
                        : "Loading"),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.cloud),
                    title: Text('Weather'),
                    trailing: Text(description != null
                        ? '${description.toString()}'
                        : "Loading"),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.wind),
                    title: Text('Wind'),
                    trailing:
                        Text(wind != null ? '${wind.toString()}' : "Loading"),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
