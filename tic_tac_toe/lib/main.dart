import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool xTurn = true; // The first player plays 'X'
  int OScore = 0;
  int XScore = 0;
  int boxesFilled = 0;
  var myTextStyle = TextStyle(fontSize: 25.0, color: Colors.white);
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];

  void tapped(int index) {
    setState(() {
      if (xTurn && displayXO[index] == '') {
        displayXO[index] = 'x';
        boxesFilled += 1;
      } else if (!xTurn && displayXO[index] == '') {
        displayXO[index] = 'o';
        boxesFilled += 1;
      }
      xTurn = !xTurn;
      checkWinner();
    });
  }

  void checkWinner() {
    // Checks 1st row
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      showWinDialog(displayXO[0]);
    }

    // Checks 2nd row
    else if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      showWinDialog(displayXO[3]);
    }

    // Checks 3rd row
    else if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      showWinDialog(displayXO[6]);
    }
    // Checks left cross diagonal
    else if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      showWinDialog(displayXO[0]);
    }

    // Checks right cross diagonal
    else if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      showWinDialog(displayXO[2]);
    }

    // Checks 1st column
    else if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      showWinDialog(displayXO[0]);
    }

    // Checks 2nd column
    else if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      showWinDialog(displayXO[1]);
    }

    // Checks 3rd column
    else if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      showWinDialog(displayXO[2]);
    } else if (boxesFilled == 9) {
      showDrawDialog();
    }
  }

  void showWinDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Winner is: ' + winner),
          actions: <Widget>[
            FlatButton(
                child: Text('Play Again!'),
                onPressed: () {
                  clearBoard();
                  Navigator.of(context).pop();
                })
          ],
        );
      },
    );
    if (winner == 'o') {
      OScore += 1;
    } else if (winner == 'x') {
      XScore += 1;
    }
  }

  void clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
      boxesFilled = 0;
    });
  }

  void showDrawDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Match is a draw'),
          actions: <Widget>[
            FlatButton(
                child: Text('Play Again!'),
                onPressed: () {
                  clearBoard();
                  Navigator.of(context).pop();
                })
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Player X',
                            style: myTextStyle,
                          ),
                          Text(
                            XScore.toString(),
                            style: myTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Player O',
                            style: myTextStyle,
                          ),
                          Text(
                            OScore.toString(),
                            style: myTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    tapped(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[600])),
                    child: Center(
                      child: Text(
                        displayXO[index],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Container(
                child: Text(
                  "@CREATEDBYRISG99",
                  style: myTextStyle.copyWith(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
