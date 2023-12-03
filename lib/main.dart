import 'package:flutter/material.dart';
import 'package:driedfruits/HomePage/newHomePage.dart';

var deviceHeight;
var deviceWidth;
double circleRadius = 0;
double circleDiameter = 0;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    circleRadius = deviceWidth * 0.4;
    circleDiameter = circleRadius * 2;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewHomePage(),
    );
  }
}
