import 'package:flutter/material.dart';

const pi = 3.14;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  double width = 50;
  double height = 50;
  double value = 18;
  void update() {
    setState(() {
      value = 30;
      width = 200;
      height = 200;
    });
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _controller.repeat();

    super.initState();
    update();
  }

  @override
  void dispose() {
    _controller.dispose();
    update();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[400],
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/start.jpg"),
            fit: BoxFit.fill,
            color: Colors.black45,
            colorBlendMode: BlendMode.luminosity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Center(
                child: AnimatedBuilder(
                  animation: _controller.view,
                  builder: (context, child) {
                    return Transform.rotate(
                        angle: _controller.value * 2 * pi, child: child);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50.0),
                    child: Container(
                      height: 200.0,
                      width: 200.0,
                      // color: Colors.green,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          color: Colors.green),
                      child: Stack(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            clipBehavior: Clip.antiAlias,
                            child: Image(
                              image: AssetImage("assets/earth.jpg"),
                            ),
                          ),
                          Center(
                              child: Text('Save Earth',
                                  style: Theme.of(context).textTheme.headline6))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
             
            ],
          ),
          SizedBox(
            height: 50.0,
            width:300,
            child: Center(
              child: RaisedButton(
                elevation: 15.0,
               child: Text('Get Started',style:TextStyle(color:Colors.white)),
               color:Colors.orangeAccent[700],
               onPressed: (){}
              ),
            ),
          ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
               Align(
                 alignment: Alignment.bottomLeft,
                 child: Container(
                   height: 160.0,
                   width: 100.0,
                   // color: Colors.green,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(40)),
                       color: Colors.transparent),
                   child: Stack(
                     children: <Widget>[
                       ClipRRect(
                         borderRadius: BorderRadius.all(Radius.circular(40)),
                         clipBehavior: Clip.antiAlias,
                         child: Image(
                           image: AssetImage("assets/fire.gif"),
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
               Align(
                 alignment: Alignment.bottomLeft,
                 child: Container(
                   height: 160.0,
                   width: 100.0,
                   // color: Colors.green,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(40)),
                       color: Colors.transparent),
                   child: Stack(
                     children: <Widget>[
                       ClipRRect(
                         borderRadius: BorderRadius.all(Radius.circular(40)),
                         clipBehavior: Clip.antiAlias,
                         child: Image(
                           image: AssetImage("assets/water.gif"),
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
               Align(
                 alignment: Alignment.bottomLeft,
                 child: Container(
                   height: 160.0,
                   width: 100.0,
                   // color: Colors.green,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(40)),
                       color: Colors.transparent),
                   child: Stack(
                     children: <Widget>[
                       ClipRRect(
                         borderRadius: BorderRadius.all(Radius.circular(40)),
                         clipBehavior: Clip.antiAlias,
                         child: Image(
                           image: AssetImage("assets/earth.gif"),
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
               
             ],
           ),
        ],
      ),
    );
  }
}
