import 'package:flutter/material.dart';

class CarbonResult extends StatelessWidget {
  final res;
  const CarbonResult({Key key, this.res}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Container(
        height: size.height,
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.25,
              width: size.width,
              color: Colors.green[300],
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Current Carbon FootPrint of your household is ${res.toStringAsFixed(1)}',
                        style: TextStyle(color: Colors.white, fontSize: 30)),
                  ),
                ],
              ),
            ),
            res < 12
                ? Container(
                  color: Colors.white,
                    height: size.height * 0.6,
                    child: Image.asset('images/hurray.gif'),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
