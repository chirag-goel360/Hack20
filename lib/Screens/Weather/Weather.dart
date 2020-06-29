import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  var temp;
  var description;
  var humidity;
  var wind;
  var currently;

  getPosition() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemark = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemark[0].administrativeArea);
    setState(() {
      city = placemark[0].administrativeArea;
    });
  }

  String city = '';

  Future getcity() async {
    String appId = 'db88d8a495a4e3fc4e181645da22796f';
    final weatherResponse = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=$appId');
    var result = json.decode(weatherResponse.body);
    if (weatherResponse.statusCode == 200) {
      setState(() {
        this.temp = result['main']['temp'];
        this.description = result['weather'][0]['description'];
        this.humidity = result['main']['humidity'];
        this.wind = result['wind']['speed'];
        this.currently = result['weather'][0]['main'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getPosition().then((position) {
      getcity();
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
            color: Colors.blue[200], 
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
                          city = value;
                          getcity();
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
                      ? '${(temp - 273.15).toStringAsFixed(1)}°C'
                      : "Loading",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "current Temperature of ${city.toUpperCase()}",
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
                        ? '${(temp - 273.15).toStringAsFixed(1)}°C'
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
