import 'package:farmerfame/Screens/CarbonFoot.dart';
import 'package:farmerfame/Weather.dart';
import 'package:farmerfame/main.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'news_card.dart';

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  Animation rotationAnimation;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Statistics"),
          backgroundColor: Colors.green[300],
        ),
        body: Stack(fit: StackFit.expand, children: <Widget>[
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(5),
              // height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                        height: 125,
                        child: TypewriterAnimatedTextKit(
                            speed: Duration(milliseconds: 25),
                            isRepeatingAnimation: false,
                            onTap: () {
                              print("Tap Event");
                            },
                            text: [
                              "Global CO2 Emissions Saw Record Drop During Pandemic Lockdown",
                              // "Why do we need a lockdown for such a change?",
                            ],
                            textStyle: TextStyle(
                                fontSize: 30.0, fontFamily: "Merriweather"),
                            textAlign: TextAlign.start,
                            alignment: AlignmentDirectional
                                .topStart // or Alignment.topLeft
                            )),
                  ),
                  // TODO: Replace below Image with Actual Graph or Stats
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset(
                        'images/co2_comparison_marked.png',
                      )),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Why do we need a lockdown for such a change?",
                      style:
                          TextStyle(fontSize: 22, fontFamily: "Merriweather"),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Image.asset(
                    "images/pollution_reduce1.jpg",
                    // height: 200,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    "images/pollution_reduce2.png",
                    height: 250,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Global experts call for a target limit of approximately 2 tonnes per person per year.",
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(16),
                    height: 4,
                    color: Colors.amber,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                        child: Text(
                          "Start",
                          style: TextStyle(fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        // padding: EdgeInsets.symmetric(vertical: 2, horizontal: 0),
                        child: FadeAnimatedTextKit(
                            duration: Duration(seconds: 5),
                            repeatForever: true,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute<void>(
                                builder: (BuildContext context) {
                                  return CarbonFootPrint();
                                },
                              ));
                            },
                            text: ["TODAY....", "RIGHT NOW!"],
                            textStyle: TextStyle(
                                fontSize: 30.0, fontFamily: "Merriweather"),
                            textAlign: TextAlign.start,
                            alignment: AlignmentDirectional
                                .center // or Alignment.topLeft
                            ),
                      ),
                    ],
                  ),

                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                      child: Text(
                        "to reduce your carbon footprint.",
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                      )),
                  Container(
                    margin: EdgeInsets.all(16),
                    height: 4,
                    color: Colors.amber,
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text("See the Impact it Leaves",
                        style: TextStyle(fontSize: 26),
                        textAlign: TextAlign.start),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "AIR",
                      style:
                          TextStyle(fontSize: 20, fontFamily: "Merriweather"),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        NewsCard(
                          title:
                              "Air pollution and CO2 fall rapidly as virus spreads",
                          link:
                              "https://www.bbc.com/news/science-environment-51944780",
                          // text:
                          //     "The dramatic slowdown in economic activity across Europe as a result of Coronavirus lockdowns can already be seen from space...",
                          // image: "images/heatmap_co2.jpg",
                        ),
                        NewsCard(
                          title:
                              "How the coronavirus pandemic slashed carbon emissions",
                          link:
                              "https://www.livescience.com/carbon-dioxide-reduction-coronavirus-lockdown.html",
                          // text:
                          //     "he international response to the coronavirus pandemic has so far slashed global carbon emissions by more than 8%, according to detailed estimates...",
                          // image: "images/heatmap_co2.jpg",
                        ),
                        NewsCard(
                          title:
                              "Global carbon emissions dropped an unprecedented 17% during the coronavirus lockdown",
                          // text: "lorem ipsum sit amet...",
                          // image: "images/heatmap_co2.jpg",
                          link:
                              "https://www.livescience.com/carbon-dioxide-reduction-coronavirus-lockdown.html",
                        ),

                        ///add more as you wish
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "WATER",
                      style:
                          TextStyle(fontSize: 20, fontFamily: "Merriweather"),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        NewsCard(
                          title: "COVID-19 lockdown: A ventilator for rivers",
                          link:
                              "https://www.downtoearth.org.in/blog/covid-19-lockdown-a-ventilator-for-rivers-70771",
                          // text: "lorem ipsum sit amet...",
                          // image: "images/heatmap_co2.jpg",
                        ),
                        NewsCard(
                          title:
                              "COVID-19 lockdown brings fresher air, cleaner rivers in India",
                          link:
                              "https://www.marketwatch.com/story/covid-19-lockdown-brings-fresher-air-cleaner-rivers-in-india-2020-04-22",
                          // text: "lorem ipsum sit amet...",
                          // image: "images/heatmap_co2.jpg",
                        ),
                        NewsCard(
                          title:
                              "Lockdown Imposed Due To Coronavirus Improves Water Quality Of Ganga, Yamuna",
                          link:
                              "https://swachhindia.ndtv.com/lockdown-imposed-due-to-coronavirus-improves-water-quality-of-ganga-yamuna-44201/",
                          // text: "lorem ipsum sit amet...",
                          // image: "images/heatmap_co2.jpg",
                        ),

                        ///add more as you wish
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Stack(
            children: <Widget>[
              Positioned(
                  right: 30,
                  bottom: 30,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      IgnorePointer(
                        child: Container(
                          color: Colors.transparent, // comment or change to transparent color
                          height: 150.0,
                          width: 150.0,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(270),
                            degOneTranslationAnimation.value * 100),
                        child: Transform(
                          transform: Matrix4.rotationZ(
                              getRadiansFromDegree(rotationAnimation.value))
                            ..scale(degOneTranslationAnimation.value),
                          alignment: Alignment.center,
                          child: CircularButton(
                            color: Colors.blue,
                            width: 50,
                            height: 50,
                            icon: Icon(
                              FontAwesomeIcons.cloudRain,
                              color: Colors.white,
                            ),
                            onClick: () {
                             Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Weather();
                  },
                ));
                            },
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(180),
                            degTwoTranslationAnimation.value * 100),
                        child: Transform(
                          transform: Matrix4.rotationZ(
                              getRadiansFromDegree(rotationAnimation.value))
                            ..scale(degTwoTranslationAnimation.value),
                          alignment: Alignment.center,
                          child: CircularButton(
                            color: Colors.black,
                            width: 50,
                            height: 50,
                            icon: Icon(
                             FontAwesomeIcons.carCrash,
                              color: Colors.white,
                            ),
                            onClick: () {
                              Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return CarbonFootPrint();
                  },
                ));
                            },
                          ),
                        ),
                      ),
                     
                      Transform(
                        transform: Matrix4.rotationZ(
                            getRadiansFromDegree(rotationAnimation.value)),
                        alignment: Alignment.center,
                        child: CircularButton(
                          color: Colors.red,
                          width: 60,
                          height: 60,
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onClick: () {
                            if (animationController.isCompleted) {
                              animationController.reverse();
                            } else {
                              animationController.forward();
                            }
                          },
                        ),
                      )
                    ],
                  ))
            ],
          )
        ]));
  }
}
