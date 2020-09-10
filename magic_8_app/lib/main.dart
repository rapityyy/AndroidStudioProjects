import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false, //To remove the debug banner
        home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Magic 8 Ball')),
            backgroundColor: Colors.black,
          ),
          body: MagicBall(),
        ),
      ),
    );

class MagicBall extends StatefulWidget {
  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  //Variables
  int ballNum = 1;
  Random randomBall = Random();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FlatButton(
            child: Image.asset('images/ball$ballNum.png'),
            onPressed: () {
              changeAnswer();
              print('Button pressed returns Ball Number $ballNum');
            },
          ),
        ),
      ],
    );
  }

  void changeAnswer() {
    setState(() {
      ballNum = randomBall.nextInt(5) + 1;
    });
  }
}
