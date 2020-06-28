import 'package:farmerfame/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      home: SplashScreen(),
      theme: ThemeData(colorScheme: ColorScheme.light()),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
    );
  }
}
