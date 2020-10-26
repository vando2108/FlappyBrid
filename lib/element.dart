import 'package:flutter/material.dart';

final imagelink = "lib/images/image.png";

class Bird extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      child: Image.asset("lib/images/bird.png"),
    );
  }
}

class FlappyBird extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Image.asset("lib/images/flappybird.png"),
    );
  }
}

class Play extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(child: Image.asset("lib/images/play.png")),
    );
  }
}

class Rank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(child: Image.asset("lib/images/rank.png")),
    );
  }
}

class Tap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Image.asset("lib/images/tap.png"),
      ),
    );
  }
}

class GetReady extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(child: Image.asset("lib/images/getready.png")),
    );
  }
}

class PipeUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Image.asset("lib/images/pipeup.png"),
      ),
    );
  }
}

class PipeDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Image.asset("lib/images/pipedown.png"),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Container(
        child: Image.asset("lib/images/bottombar.png"),
      ),
    );
  }
}
