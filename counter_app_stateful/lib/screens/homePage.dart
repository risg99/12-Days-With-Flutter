import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void increment() {
    setState(() {
      _counter += 1;
    });
  }

  void decrement() {
    setState(() {
      _counter -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: TextStyle(fontSize: 80.0),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: increment,
                  child: Icon(Icons.add),
                  tooltip: 'Increment',
                ),
                SizedBox(width: 20.0),
                FloatingActionButton(
                  onPressed: decrement,
                  child: Icon(Icons.remove),
                  tooltip: 'Decrement',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
