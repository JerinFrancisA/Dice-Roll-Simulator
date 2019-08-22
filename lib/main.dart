import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(child: Text('Dicee')),
          backgroundColor: Colors.red,
        ),
        body: MyDice(),
      ),
    ),
  );
}

class MyDice extends StatefulWidget {
  @override
  _MyDiceState createState() => _MyDiceState();
}

class _MyDiceState extends State<MyDice> {
  int lnum = 1;
  int rnum = 1;
  String oe = 'EVEN';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        change();
                      },
                      child: Image.asset('images/dice$lnum.png'),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        change();
                      },
                      child: Image.asset('images/dice$rnum.png'),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'SUM = ${lnum + rnum} ($oe)',
              style: TextStyle(
                color: Colors.amber,
                fontFamily: 'FredokaOne',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Card(
              child: FlatButton(
                splashColor: Colors.red,
                color: Colors.white,
                onPressed: () {
                  change();
                },
                child: IconButton(
                  iconSize: 40.0,
                  color: Colors.red,
                  icon: Icon(Icons.call_missed_outgoing),
                  onPressed: () {
                    change();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              "ROLL",
              style: TextStyle(
                color: Colors.cyan,
                fontFamily: 'FredokaOne',
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 3.0,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
    );
  }

  void change() {
    setState(() {
      lnum = Random().nextInt(6) + 1;
      rnum = Random().nextInt(6) + 1;
      if ((lnum + rnum) % 2 == 0) {
        oe = "EVEN";
      } else {
        oe = "ODD";
      }
    });
  }
}
