import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Background Changer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var randomColorList = [
    Colors.orange,
    Colors.amberAccent,
    Colors.black38,
    Colors.purpleAccent,
    Colors.greenAccent,
    Colors.blueGrey,
    Colors.blueAccent,
    Colors.redAccent,
    Colors.pinkAccent,
  ];

  var colorRightNow = Colors.deepPurpleAccent;
  var colorButtonNow = Colors.yellowAccent[100];

  void changeColor() {
    int index = Random().nextInt(randomColorList.length);
    int buttonIndex = Random().nextInt(randomColorList.length);
    setState(() {
      colorRightNow = randomColorList[index];
      colorButtonNow = randomColorList[buttonIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   // decoration: BoxDecoration(color: colorRightNow),
    //   color: colorRightNow,
    //   child: RaisedButton(
    //     color: colorButtonNow,
    //     highlightColor: Colors.transparent,
    //     splashColor: Colors.transparent,
    //     child: Text(
    //       'Change !!!',
    //       style: TextStyle(
    //         fontSize: 24.0,
    //         fontStyle: FontStyle.italic,
    //         fontWeight: FontWeight.bold,
    //         color: Colors.white,
    //       ),
    //     ),
    //     padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(10.0),
    //     ),
    //     onPressed: changeColor,
    //   ),
    // );
    return Container(
      color: colorRightNow,
      child: Center(
        child: RaisedButton(
          color: colorButtonNow,
          child: Text(
            "Change Me",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
          onPressed: changeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
