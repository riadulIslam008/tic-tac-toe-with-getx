import 'dart:async';
import 'package:get/get.dart';
import 'package:tic_tac_toe/Core/Veriable.dart';
import 'package:tic_tac_toe/Use_Cases/Check_Wining_Index.dart';
import 'package:tic_tac_toe/Use_Cases/Winnning_Dialog.dart';

class GameController extends GetxController {

  Timer? timerOne;
  RxBool playerController = true.obs;
  RxBool playerChange = true.obs;

  RxInt playerOneTimer = 5.obs;
  RxInt playerTwoTimer = 5.obs;

  timeDecrement() {
    if (playerController.value) {
      timerOne = Timer.periodic(Duration(seconds: 1), (_) {
        playerOneTimer.value--;
        if (playerOneTimer.value == 0) {
          winningDialog("✖");
          timerOne!.cancel();
        }
      });
    } else {
      timerOne = Timer.periodic(Duration(seconds: 1), (_) {
        playerTwoTimer.value--;
        if (playerTwoTimer.value == 0) {
          winningDialog("O");
          timerOne!.cancel();
        }
      });
    }
  }

  clearAllValue() {
    for (var i = 0; i < itemList.length; i++) {
      if (itemList[i] != null) itemList[i] = null;
    }
  }

  changeValue(index) {
    int spot = 0;
    if (timerOne != null) {
      timerOne!.cancel();
    }
    var zeroORcross = playerController.value ? "O" : "✖";
    String winnerName = "None";

    if (itemList[index] == null) {
      itemList[index] = zeroORcross;
      update();
      winnerName = winningLogic(index);
      if (winnerName == "O" || winnerName == "✖") winningDialog(winnerName);

      // Match Draw or Not
      if (winnerName == "NONE") {
        for (int i = 0; i < itemList.length; i++) {
          if (itemList[i] == null) spot++;
        }
        if (spot == 0) {
          timerOne!.cancel();
          winningDialog(winnerName);
        }
      }
    } else {
      return;
    }
    //if spot != 0 that's mean match should continue play and also match result is n't get
    if (spot != 0) {
      playerController.value = !playerController.value;
      playerChange.value = !playerChange.value;
      timeDecrement();
      playerController.value
          ? playerTwoTimer.value = 5
          : playerOneTimer.value = 5;
      update();
    }
  }

  startOverNew() {
    clearAllValue();
    playerController.value = !playerController.value;
    timerOne!.cancel();
    playerOneTimer.value = 5;
    playerTwoTimer.value = 5;
    update();
    Get.back();
  }

  void winningDialog(item) {
    if (timerOne != null) timerOne!.cancel();
    winningMessage(item, () => startOverNew());
  }

  @override
  void onClose() {
   if(timerOne != null)  timerOne!.cancel();
    clearAllValue();
    super.dispose();
  }
}
