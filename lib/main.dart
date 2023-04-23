import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: JankenPage(),
    );
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  String myHand = "✊";
  String computerHand = "✊";
  String result = "勝負スタート！！";
  
  void selectHand(String selectedHand) {
    myHand = selectedHand;
    generateComputerHand();
    judgeJanken();
    setState(() {});
  }

  void generateComputerHand() {
    computerHand = numToHand(Random().nextInt(3));
  }

  String numToHand(int num) {
    switch(num) {
      case 0:
        return "✊";
      case 1:
        return "✌️";
      case 2:
        return "✋";
      default:
        return "✊";
    }
  }

  void judgeJanken() {
    if (myHand == computerHand) {
      result = "あいこ";
    } else if (myHand == "✊" && computerHand == "✌️") {
      result = "勝ち";
    } else if (myHand == "✌️" && computerHand == "✋") {
      result = "勝ち";
    } else if (myHand == "✋" && computerHand == "✊") {
      result = "勝ち";
    } else {
      result = "負け";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('じゃんけん'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result,
              style: const TextStyle(fontSize: 32),
            ),
            const Text(
            '相手の手は...',
            style: TextStyle(fontSize: 24),
            ),
            Text(
              computerHand,
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(
              height: 36,
            ),
            const Text(
              'あなたの手を選んでください',
              style: TextStyle(fontSize: 24),
              ),
            const SizedBox(
              height: 32,
            ),
            Text(
              myHand,
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    selectHand("✊");
                  },
                  child: const Text('✊'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand("✌️");
                  },
                  child: const Text('✌️'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand("✋");
                  },
                  child: const Text('✋'),
                ),
              ],
            ),
          ],)
      ),
    );
  }
}