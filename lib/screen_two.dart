import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();

    return MaterialApp(
      home: Scaffold(
          body: Column(
        children: [
          const Text('Welcome from screen 2'),
          ElevatedButton(
              onPressed: () {
                player.play(AssetSource('not1sec.wav'));
                Navigator.pop(context);
              },
              child: const Text('Go back'))
        ],
      )),
    );
  }
}
