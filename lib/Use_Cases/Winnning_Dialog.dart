import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/Core/Veriable.dart';

void winningMessage(item, VoidCallback startNewGame) {
  var winningPlayer = item == "O" ? "One" : "Two";
  Get.defaultDialog(
    title: " Congretulation 👏👏",
    titlePadding: const EdgeInsets.all(20),
    middleText: "😎😎 Player $winningPlayer 😎😎",
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

void aiWinningMessage( VoidCallback startNewGame) {
 
  Get.defaultDialog(
    title: " Opps! 😓",
    titlePadding: const EdgeInsets.all(20),
    middleText: "You lost",
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
