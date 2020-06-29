import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:mccounting_text/mccounting_text.dart';

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
      backgroundColor: Colors.green,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              // height: size.height * 0.5,
              // width: size.width,
              color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Text(
                  //       'Current Carbon FootPrint of your household is ${res.toStringAsFixed(1)}',
                  //       style: TextStyle(color: Colors.white, fontSize: 30)),
                  // ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text("Current Carbon Footprint of your household is",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 30)),
                  ),
                  McCountingText(
                    begin: 0,
                    end: res.toDouble(),
                    style: Theme.of(context).textTheme.display2,
                    duration: Duration(seconds: 2),
                    curve: Curves.decelerate,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text("Tons",
                        style: TextStyle(color: Colors.white, fontSize: 30)),
                  ),

                  res < 12
                      ? SizedBox(
                          width: 400.0,
                          child: ColorizeAnimatedTextKit(
                              speed: Duration(milliseconds: 100),
                              onTap: () {
                                print("Tap Event");
                              },
                              text: [
                                "Congratulations!",
                                "You are doing better than others!",
                              ],
                              textStyle: TextStyle(fontSize: 36.0),
                              colors: [
                                Colors.white,
                                Colors.black,
                              ],
                              textAlign: TextAlign.center,
                              alignment: AlignmentDirectional
                                  .topStart // or Alignment.topLeft
                              ),
                        )
                      : Container()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
