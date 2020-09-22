import 'package:flutter/material.dart';

const bottom 
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(colour: Color(0xFF121528)),
                ),
                Expanded(
                  child: ReusableCard(colour: Color(0xFF6F7F7)),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(colour: Color(0xFF121528)),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(colour: Color(0xFF121528)),
                ),
                Expanded(
                  child: ReusableCard(colour: Color(0xFF121528)),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Color(0xFFEB1455),
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour});

  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: this.colour,
      ),
    );
  }
}
