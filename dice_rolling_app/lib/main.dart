import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(DiceRollingApp());
}

class DiceRollingApp extends StatefulWidget {
  @override
  _DiceRollingAppState createState() => _DiceRollingAppState();
}

class _DiceRollingAppState extends State<DiceRollingApp> {
  int nextDice1Image = 1;
  int nextDice2Image = 6;
  var answer = 'You need to roll !!!';
  void rollDice() {
    setState(() {
      nextDice1Image = Random().nextInt(6) + 1;
      nextDice2Image = Random().nextInt(6) + 1;
      answer = 'You need to roll !!!';
    });
    if (nextDice1Image == nextDice2Image) {
      answer = 'Dice Duo achieved';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.cyanAccent[100],
        appBar: AppBar(
          backgroundColor: Colors.cyanAccent[700],
          title: Center(child: Text('Dice Rolling Application')),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 120.0,
              ),
              Text(
                answer,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 38.0,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/dice/dice_$nextDice1Image.png',
                      width: 150.0,
                      height: 150.0,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Image.asset(
                      'assets/dice/dice_$nextDice2Image.png',
                      width: 150.0,
                      height: 150.0,
                    ),
                  ],
                ),
              ),
              Spacer(),
              RaisedButton(
                onPressed: rollDice,
                child: Text(
                  'Roll The Dices',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
              SizedBox(
                height: 120.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
