import 'package:FlappyBrid/element.dart';
import 'package:FlappyBrid/gamescreen.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/images/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(top: 100),
                child: Center(child: FlappyBird()),
              )),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 54, top: 60),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GameScreen()),
                        );
                      },
                      child: Center(
                        child: Play(),
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(20.0),
                      child: GestureDetector(
                        child: Center(
                          child: Rank(),
                        ),
                        onTap: null,
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Center(child: Text("Made by Kdimo")),
            ),
          )
        ],
      ),
    ));
  }
}

class GetsDetector extends StatelessWidget {
  const GetsDetector({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Play());
  }
}
