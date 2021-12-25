import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/Routes/App_Routes.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           CircleWithTitle(titleText: "Play With Friend", onPressed: ()=> Get.toNamed(Routes.PLAY_WITH_FRIEND)),
           CircleWithTitle(titleText: "Play With System", onPressed: ()=> Get.toNamed(Routes.PLAY_WITH_System)),
          ],
        ),
      ),
    );
  }
}

class CircleWithTitle extends StatelessWidget {
  const CircleWithTitle(
      {Key? key, required this.titleText, required this.onPressed})
      : super(key: key);
  final String titleText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.red,
      borderRadius: BorderRadius.circular(90),
      onTap: onPressed,
      child: CircleAvatar(
        backgroundColor: Colors.teal,
        radius: 100,
        child: Center(
          child: Text(
            titleText,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
