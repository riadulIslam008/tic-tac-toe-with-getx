import 'package:get/get.dart';
import 'package:tic_tac_toe/Core/Veriable.dart';
import 'package:tic_tac_toe/Use_Cases/Ai/Mini_Max_Algo.dart';
import 'package:tic_tac_toe/Use_Cases/Check_Wining_Index.dart';
import 'package:tic_tac_toe/Use_Cases/Winnning_Dialog.dart';

class AiViewController extends GetxController {
  claerAll() {
    for (var i = 0; i < itemList.length; i++) {
      itemList[i] = null;
    }
    update();
  }

  void winningDialog() {
    aiWinningMessage(() => startOverNew());
  }

  void changeValue(int index) {
    final controller = Get.find<AiViewController>();
    if (itemList[index] == null) {
      itemList[index] = HUMAN;
      update();
      winningLogic(index, controller);
      int? bestMove;

      // Ai move
      int bestScore = -999999999;
      for (int i = 0; i < itemList.length; i++) {
        if (itemList[i] == null) {
          itemList[i] = AI_MOVE;
          final score = minimaxAlgo(false, itemList);

          print("index $i == Score $score");
          itemList[i] = null;
          if (score > bestScore) {
            bestScore = score;
            bestMove = i;
          }
        }
      }
      if (bestMove != null) itemList[bestMove] = AI_MOVE;
      update();
      winningLogic(bestMove, controller);
    }
  }

  startOverNew() {
    claerAll();
    Get.back();
  }
}
