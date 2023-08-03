import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  XylophoneApp({super.key});

  void playSound(num) {
    final player = AudioPlayer();
    player.play(AssetSource('note$num.wav'));
  }

  Expanded buildKey(color, num, text) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(color)),
        onPressed: () {
          playSound(num);
        },
        child: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              title: const Center(child: Text("Xylophone")),
              backgroundColor: Colors.black,
            ),
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildKey(Colors.red, 1, "Sa"),
                  buildKey(Colors.orange, 2, "Re"),
                  buildKey(Colors.yellow, 3, "Ga"),
                  buildKey(Colors.lightGreen, 4, "Ma"),
                  buildKey(Colors.green, 5, "Pa"),
                  buildKey(Colors.blue, 6, "Da"),
                  buildKey(Colors.purple, 7, "Ni"),
                ],
              ),
            )));
  }
}
