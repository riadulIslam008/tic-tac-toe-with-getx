import 'package:flutter/material.dart';
import 'package:get/get.dart';

void winningMessage(item, VoidCallback startNewGame) {
  var winningPlayer = item == "O"
      ? "Player One"
      : item == "NONE"
          ? "Match Tie"
          : "Player Two";
  Get.defaultDialog(
    title: " Congretulation 👏👏",
    titlePadding: const EdgeInsets.all(20),
    middleText: "😎😎  $winningPlayer 😎😎",
    barrierDismissible: false,
    confirm: Row(
      children: [
        Expanded(child: Container()),
        InkWell(
          onTap: startNewGame,
          child: Container(
            alignment: Alignment.bottomRight,
            color: Colors.teal[300],
            padding: EdgeInsets.all(10),
            child: Text("New Game"),
          ),
        ),
      ],
    ),
  );
}

void aiWinningMessage(VoidCallback startNewGame, String item) {
  final bool _matchDraw = item == "NONE" ? true : false;
  Get.defaultDialog(
    title: " Opps! 😓",
    titlePadding: const EdgeInsets.all(20),
    middleText: _matchDraw ? "🤔🤔 Match Tie 🤔🤔" : "You lost",
    barrierDismissible: false,
    confirm: Row(
      children: [
        Expanded(child: Container()),
        InkWell(
          onTap: startNewGame,
          child: Container(
            alignment: Alignment.bottomRight,
            color: Colors.teal[300],
            padding: EdgeInsets.all(10),
            child: Text("New Game"),
          ),
        ),
      ],
    ),
  );
}
