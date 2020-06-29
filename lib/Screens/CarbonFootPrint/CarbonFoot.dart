import 'package:farmerfame/Logic/CalculateCarbon.dart';
import 'package:farmerfame/Screens/CarbonFootPrint/CarbonResult.dart';
import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

class CarbonFootPrint extends StatefulWidget {
  @override
  _CarbonFootPrintState createState() => _CarbonFootPrintState();
}

class _CarbonFootPrintState extends State<CarbonFootPrint> {
  String radioValue;
  String choice;
  String radioValue2;
  String choice2;
  var _formKey = GlobalKey<FormState>();
  void radioButtonChanges(String value) {
    setState(() {
      radioValue = value;
      switch (value) {
        case 'Yes':
          choice = value;
          break;
        case 'No':
          choice = value;
          break;
        default:
          choice = null;
      }
      debugPrint(choice); //Debug the choice in console
    });
  }

  String people;
  String gas;
  String energy;
  String cars;
  String milage = "";
  void radioButtonChanges2(String value) {
    setState(() {
      radioValue2 = value;
      switch (value) {
        case 'Sports':
          setState(() {
            choice2 = value;
            milage = "35";
          });

          break;
        case 'small':
          setState(() {
            choice2 = value;
            milage = "46";
          });

          break;
        case 'City':
          setState(() {
            choice2 = value;
            milage = "52";
          });

          break;
        case 'milage':
          setState(() {
            choice2 = value;
          });
          break;
      }
      debugPrint(choice2);
      print(milage); //Debug the choice in console
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Calculate Carbon FootPrint'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                  Colors.green[400],
                  Colors.greenAccent[400]
                ])),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: ListView(
              physics: BouncingScrollPhysics(),
              // mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text('Fill these details',
                      style: TextStyle(color: Colors.black, fontSize: 20.0)),
                ),
                SizedBox(height: 30.0),
                Text(
                  'Q1) How many people are there in your household?',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 50.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'How many people',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                    onSaved: (String val) {
                      people = val;
                    },
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  'Q2) How much electricity is used in your houesehold?',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 50.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'How much electricity',
                      suffix: Text('kWh'),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                    onSaved: (String val) {
                      energy = val;
                    },
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  'Q3) How much gas is used in your houesehold?',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 50.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'How much gas',
                      suffix: Text('kWh'),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                    onSaved: (String val) {
                      gas = val;
                    },
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  'Q4) Is heating oil, coal, wood or bottled gas used in your household?',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 38,
                    ),
                    Radio(
                      activeColor: Colors.green,
                      value: 'Yes',
                      groupValue: radioValue,
                      onChanged: radioButtonChanges,
                    ),
                    Text(
                      "Yes",
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Radio(
                      activeColor: Colors.red,
                      value: 'No',
                      groupValue: radioValue,
                      onChanged: radioButtonChanges,
                    ),
                    Text(
                      "No",
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                Text(
                  'Q5) How many cars are used by your household?',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 50.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'How many cars',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                    onSaved: (String val) {
                      cars = val;
                    },
                  ),
                ),
                SizedBox(height: 30.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Select Car Size:',
                        style: TextStyle(color: Colors.black, fontSize: 15.0)),
                    Row(
                      children: <Widget>[
                        Radio(
                          activeColor: Colors.green,
                          value: 'Sports',
                          groupValue: radioValue2,
                          onChanged: radioButtonChanges2,
                        ),
                        Text(
                          "Sports car or large SUV (35 mpg) ",
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Radio(
                          activeColor: Colors.green,
                          value: 'small',
                          groupValue: radioValue2,
                          onChanged: radioButtonChanges2,
                        ),
                        Text(
                          "Small or medium SUV, or MPV (46 mpg)",
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Radio(
                          activeColor: Colors.green,
                          value: 'City',
                          groupValue: radioValue2,
                          onChanged: radioButtonChanges2,
                        ),
                        Text(
                          "City, small, medium, large or estate car (52 mpg)",
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Radio(
                          activeColor: Colors.green,
                          value: 'milage',
                          groupValue: radioValue2,
                          onChanged: radioButtonChanges2,
                        ),
                        Text(
                          "Enter actual mpg: ",
                        ),
                      ],
                    ),
                    Container(
                      height: 50.0,
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        initialValue: milage,
                        decoration: InputDecoration(
                          hintText: 'Enter mpg',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                        ),
                        onSaved: (value) {
                          milage = value;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                SizedBox(
                    height: 50,
                    child: RaisedButton(
                      color: Colors.green[600],
                      textColor: Colors.white,
                      child: Text("Calculate carbon footprint"),
                      elevation: 10.0,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          var res=calculate(people, energy, gas, cars, milage);
                          Navigator.push(context, MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                              return CarbonResult(res:double.parse(res) ,);
                            },
                          ));
                        }
                      },
                    )),
                SizedBox(height: 30.0)
              ],
            ),
          ),
        ));
  }
}
