 import 'package:tic_tac_toe/Use_Cases/Winning_Function_Check.dart';

String tempWinnerLogic(List itemList) {
    String tempWinner = "NONE";
    //??? Index 1 Vertical
    if (itemList[0] != null &&
        winningCheck(itemList[0], itemList[1], itemList[2])) {
      tempWinner = itemList[0];

      //index 3
    } else if (itemList[3] != null &&
        winningCheck(itemList[3], itemList[4], itemList[5])) {
      tempWinner = itemList[3];
      //index 6
    } else if (itemList[6] != null &&
        winningCheck(itemList[6], itemList[7], itemList[8])) {
      tempWinner = itemList[6];
      //? index 0 horijontal
    } else if (itemList[0] != null &&
        winningCheck(itemList[0], itemList[3], itemList[6])) {
      tempWinner = itemList[0];
      //index 1
    } else if (itemList[1] != null &&
        winningCheck(itemList[1], itemList[4], itemList[7])) {
      tempWinner = itemList[1];
      //index 2
    } else if (itemList[2] != null &&
        winningCheck(itemList[2], itemList[5], itemList[8])) {
      tempWinner = itemList[2];
      //Kounik 0
    } else if (itemList[0] != null &&
        winningCheck(itemList[0], itemList[4], itemList[8])) {
      tempWinner = itemList[0];
    } else if (itemList[2] != null &&
        winningCheck(itemList[2], itemList[4], itemList[6])) {
      tempWinner = itemList[2];
    }

    int spot = 0;
    for (int i = 0; i < 9; i++) {
      if (itemList[i] == null) spot++;
    }

    if (spot == 0 && tempWinner == "NONE") {
      tempWinner = "DRAW";
    }
    return tempWinner;
  }
