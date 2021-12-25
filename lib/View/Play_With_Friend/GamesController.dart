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
      itemList[i] = null;
    }
  }

  changeValue(index) {
    final controller = Get.find<GameController>();
    if (timerOne != null) {
      timerOne!.cancel();
    }
    var zeroORcross = playerController.value ? "O" : "✖";

    if (itemList[index] == null) {
      itemList[index] = zeroORcross;
      winningLogic(index, controller);
    } else {
      return;
    }
    playerController.value = !playerController.value;
    playerChange.value = !playerChange.value;
    timeDecrement();
    playerController.value
        ? playerTwoTimer.value = 5
        : playerOneTimer.value = 5;
    update();
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
    winningMessage(item, () => startOverNew());
    if (timerOne!.isActive) timerOne!.cancel();
  }
}
