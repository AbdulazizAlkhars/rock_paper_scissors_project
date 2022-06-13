import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Image r_s_p(int play) {
    if (play == 0) {
      return Image.asset('assets/images/rock.png', width: 100, height: 100);
    } else if (play == 1) {
      return Image.asset('assets/images/paper.png', width: 100, height: 100);
    } else {
      return Image.asset('assets/images/scissors.png', width: 100, height: 100);
    }
  }

  String numberToName(int play) {
    if (play == 0) {
      return "rock";
    } else if (play == 1) {
      return "paper";
    } else {
      return "scissors";
    }
  }

  int _randomNumber1 = 0;
  int _randomNumber2 = 0;
  @override
  Widget build(BuildContext context) {
    String result = "";
    if (_randomNumber1 == 0 && _randomNumber2 == 0) {
      result = "Tie";
    } else if (_randomNumber1 == 1 && _randomNumber2 == 0) {
      result = "Playe1 wins";
    } else if (_randomNumber1 == 2 && _randomNumber2 == 0) {
      result = "Playe2 wins";
    } else if (_randomNumber1 == 0 && _randomNumber2 == 1) {
      result = "Player2 wins";
    } else if (_randomNumber1 == 1 && _randomNumber2 == 1) {
      result = "Tie";
    } else if (_randomNumber1 == 2 && _randomNumber2 == 1) {
      result = "Playe1 wins";
    } else if (_randomNumber1 == 0 && _randomNumber2 == 2) {
      result = "Player1 wins";
    } else if (_randomNumber1 == 1 && _randomNumber2 == 2) {
      result = "Player2 wins";
    } else {
      result = "Tie";
    }
    ;
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children: [
                  Image.asset(
                      'assets/images/${numberToName(_randomNumber1)}.png',
                      width: 100,
                      height: 100),
                  Text("Player1"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children: [
                  Image.asset(
                      'assets/images/${numberToName(_randomNumber2)}.png',
                      width: 100,
                      height: 100),
                  Text("Player2")
                ],
              ),
            )
          ]),
          Text(result),
          Container(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  Random random = Random();

                  _randomNumber1 = random.nextInt(2);
                  _randomNumber2 = random.nextInt(2);
                });
              },
              child: Text("Play"),
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Color.fromARGB(255, 46, 110, 184)),
            ),
          )
        ]),
      ),
      appBar: AppBar(title: Text("Rock Paper Scisors")),
    );
  }
}
