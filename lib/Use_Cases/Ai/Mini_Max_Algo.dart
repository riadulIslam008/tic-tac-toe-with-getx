import 'dart:math';
import 'package:tic_tac_toe/Use_Cases/Ai/Ai_Temporary_WinnerCheck.dart';

var scores = {
  "O": -1,
  "✖": 1,
  "DRAW": 0,
};
minimaxAlgo(bool isMiximizing, List itemList) {
  // frist Check Winniner
  final tempWinner = tempWinnerLogic(itemList);
  if (tempWinner != "NONE") {
    return scores[tempWinner];
  }

  if (isMiximizing) {
    int bestScore = -999999999;

    for (int i = 0; i < itemList.length; i++) {
      if (itemList[i] == null) {
        itemList[i] = "✖";
        var score = minimaxAlgo(false, itemList);
        itemList[i] = null;
        bestScore = max(score, bestScore);
      }
    }
    return bestScore;
  } else {
    int _bestScore = 9999999999;
    for (int i = 0; i < itemList.length; i++) {
      if (itemList[i] == null) {
        itemList[i] = "O";
        var score = minimaxAlgo(true, itemList);
        itemList[i] = null;
        _bestScore = min(score, _bestScore);
      }
    }

    return _bestScore;
  }
}
