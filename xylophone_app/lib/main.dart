import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildNote(c: Colors.red, num: 1),
              buildNote(c: Colors.orange, num: 2),
              buildNote(c: Colors.yellow, num: 3),
              buildNote(c: Colors.green, num: 4),
              buildNote(c: Colors.teal, num: 5),
              buildNote(c: Colors.blue, num: 6),
              buildNote(c: Colors.purple, num: 7),
            ],
          ),
        ),
      ),
    );
  }

  void playSound(int num) {
    final player = AudioCache();
    player.play('note$num.wav');
    print('Button$num Pressed');
  }

  Expanded buildNote({Color c, int num}) {
    return Expanded(
      child: FlatButton(
        color: c,
        onPressed: () {
          playSound(num);
        },
      ),
    );
  }
}
