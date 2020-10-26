import 'dart:async';
import 'dart:math';

import 'package:FlappyBrid/element.dart';
import 'package:flutter/material.dart';
import 'package:rect_getter/rect_getter.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

int rand(int a, int b) => a + Random().nextInt(b - a);

class _GameScreenState extends State<GameScreen> {
  static double birdYaxis = 0;
  double time = 0, height = 0, init = birdYaxis;
  int score = 0;
  static int bestscore = 0;
  double height1 = rand(11, 19) / 10;
  double height2 = rand(11, 19) / 10;
  double pipeXone = 1, pipeXtwo = 2.5;
  bool gameHasStarted = false, scored = false;
  var rectGetter;

  void resetState() {
    setState(() {
      bestscore = max(bestscore, score);
      birdYaxis = time = height = 0;
      score = 0;
      init = birdYaxis;
      height1 = rand(11, 19) / 10;
      height2 = rand(11, 19) / 10;
      pipeXone = 1; pipeXtwo = 2.5;
      gameHasStarted = false; scored = false;
    });
  }

  void jump() {
    setState(() {
      time = 0;
      init = birdYaxis;
    });
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        birdYaxis = init - height + 0.1;
        pipeXone -= 0.05;
        pipeXtwo -= 0.05;
      });
      if (pipeXone < -1.2) {
        var temp = pipeXone;
        setState(() {
          pipeXone = pipeXtwo;
          pipeXtwo = temp + 3;
          height1 = height2;
          height2 = rand(11, 19) / 10;
          scored = false;
        });
      }
      if (pipeXone < -0.155 && scored == false) {
        setState(() {
          score++;
          scored = true;
        });
      }
      if (birdYaxis > 1.2) {
        timer.cancel();
        _lose();
        bestscore = score;
        gameHasStarted = false;
      }
    });
  }

  void _lose() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.brown,
            title: Text(
              "GAME OVER!",
              style: TextStyle(color: Colors.white),
            ),
            content: Text(
              "SCORE: " + score.toString(),
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              FlatButton(
                child: Text(
                  "PLAY AGAIN!",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  resetState();
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  var globalKey = RectGetter.createGlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("lib/images/background.jpg"),
          fit: BoxFit.cover,
        )),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  AnimatedContainer(
                    alignment: Alignment(pipeXone, height1),
                    duration: Duration(milliseconds: 0),
                    child: PipeUp(),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(pipeXone, -3 + height1),
                    duration: Duration(milliseconds: 0),
                    child: PipeDown(),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(pipeXtwo, height2),
                    duration: Duration(milliseconds: 0),
                    child: PipeUp(),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(pipeXtwo, -3 + height2),
                    duration: Duration(milliseconds: 0),
                    child: PipeDown(),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (gameHasStarted)
                        jump();
                      else
                        startGame();
                    },
                    child: AnimatedContainer(
                      alignment: Alignment(0, birdYaxis),
                      duration: Duration(milliseconds: 0),
                      color: Colors.transparent,
                      child: gameHasStarted ? Bird() : Text(""),
                      key: globalKey,
                      onEnd: () {
                        var rect = RectGetter.getRectFromKey(globalKey);
                        globalKey = RectGetter.createGlobalKey();
                        print(rect);
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment(0, -0.5),
                    child: Text(
                      gameHasStarted ? score.toString() : "",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  Container(
                      //alignment: Alignment(0, -0.3),
                      child: gameHasStarted
                          ? Text("")
                          : Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 250.0),
                                    child: Center(
                                      child: GetReady(),
                                    ),
                                  ),
                                  Center(
                                    child: Tap(),
                                  ),
                                ],
                              ),
                            )),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("lib/images/bottombar.png"),
                  fit: BoxFit.cover,
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
