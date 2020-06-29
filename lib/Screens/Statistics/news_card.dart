import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key key,
    this.title,
    this.text,
    this.image,
    this.link = "",
  }) : super(key: key);

  final String title;
  final String text;
  final String image;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 200,
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              child: Text(
                title,
                style: TextStyle(fontSize: 14),
              ),
            ),
            RaisedButton(
              child: Text("READ"),
              color: Colors.amber,
              onPressed: () async {
                await launch(link);
              },
            ),
            // Image.asset(
            //   image,
            //   height: 100,
            // ),
            // Text(text, style: TextStyle(fontSize: 16))
          ],
        ),
      ),
    );
  }
}