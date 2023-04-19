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
            const Text(
              'あなたの手を選んでください',
              style: TextStyle(fontSize: 24),
              ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              '✊',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print("グー");
                  },
                  child: const Text('✊'),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("チョキ");
                  },
                  child: const Text('✌️'),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("パー");
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