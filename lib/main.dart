import 'package:flutter/material.dart';
import 'input_Page.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        //primaryColor: Colors.red;
        primaryColor: Color(0xFF0A0E21),
       scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),

      home: InputPage(),
    );
  }
}
