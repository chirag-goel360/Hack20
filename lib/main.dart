import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart' show radians;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SizedBox.expand(child: RadialMenu())
        )
    );
  }
}

class RadialMenu extends StatefulWidget {
  createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu> with SingleTickerProviderStateMixin {
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 900), vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return RadialAnimation(controller: controller);
  }
}

class RadialAnimation extends StatelessWidget {
  RadialAnimation({ Key key, this.controller }) :
        translation = Tween<double>(
          begin: 0.0,
          end: 100.0,
        ).animate(
          CurvedAnimation(
              parent: controller,
              curve: Curves.linear
          ),
        ),
        scale = Tween<double>(
          begin: 1.5,
          end: 0.0,
        ).animate(
          CurvedAnimation(
              parent: controller,
              curve: Curves.fastOutSlowIn
          ),
        ),
        rotation = Tween<double>(
          begin: 0.0,
          end: 360.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.3, 0.9,
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
            child: Stack(
                alignment: Alignment.center,
                children: [
                  _buildButton(0, color: Colors.red, icon: FontAwesomeIcons.sun),
                  _buildButton(60, color: Colors.green, icon:FontAwesomeIcons.sprayCan),
                  _buildButton(120, color: Colors.orange, icon: FontAwesomeIcons.fire),
                  _buildButton(180, color: Colors.blue, icon:FontAwesomeIcons.kiwiBird),
                  _buildButton(240, color: Colors.black, icon:FontAwesomeIcons.cat),
                  _buildButton(300, color: Colors.indigo, icon:FontAwesomeIcons.paw),
                  Transform.scale(
                    scale: scale.value - 1.5,
                    child: FloatingActionButton(
                        child: Icon(FontAwesomeIcons.timesCircle),
                        onPressed: _close,
                        backgroundColor: Colors.red
                    ),
                  ),
                  Transform.scale(
                    scale: scale.value,
                    child: FloatingActionButton(
                        child:
                        Icon(FontAwesomeIcons.solidDotCircle),
                        onPressed: _open
                    ),
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
  _buildButton(double angle, { Color color, IconData icon }) {
    final double rad = radians(angle);
    return Transform(
        transform: Matrix4.identity()..translate(
            (translation.value) * cos(rad),
            (translation.value) * sin(rad)
        ),
        child: FloatingActionButton(
            child: Icon(icon), backgroundColor: color, onPressed: _close, elevation: 0)
    );
  }
}