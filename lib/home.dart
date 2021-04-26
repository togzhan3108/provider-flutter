import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List colors = [
    Colors.pinkAccent,
    Colors.deepPurpleAccent,
    Colors.redAccent,
    Colors.orange,
    Colors.yellowAccent
  ];
  bool switched = false;
  Random random = Random();
  int textIndex = 0;
  int boxIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Homework Provider',
          style: TextStyle(
            color: switched ? colors[textIndex] : colors[textIndex],
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              width: 200,
              height: 200,
              color: switched ? colors[boxIndex] : colors[boxIndex],
              duration: const Duration(seconds: 1),
            ),
            Switch(
                value: switched,
                onChanged: (value) {
                  setState(() {
                    switched = !switched;
                    textIndex = random.nextInt(5);
                    boxIndex = random.nextInt(5);
                  });
                }),
          ],
        ),
      ),
    );
  }
}