import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF0B0E23),
        scaffoldBackgroundColor: Color(0xFF0B0E23),
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.white),
        ),
        accentColor: Color(0xFF1D2032),
      ),
      home: InputPage(),
    );
  }
}
