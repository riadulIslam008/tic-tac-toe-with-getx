import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  Timer? timerOne;
  RxBool playerController = true.obs;

  RxInt playerOneTimer = 5.obs;
  RxInt playerTwoTimer = 5.obs;
  List itemList = List.filled(9, null, growable: false);

  timeDecrement() {
    print(playerController.value);
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

  changeValue(index) {
    if (timerOne != null) {
      timerOne!.cancel();
    }
    var zeroORcross = playerController.value ? "O" : "✖";

    if (itemList[index] == null) {
      itemList[index] = zeroORcross;
      winningLogic(index);
    } else {
      return;
    }
    playerController.value = !playerController.value;
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

  winningDialog(item) {
    timerOne!.cancel();
    var winningPlayer = item == "O" ? "One" : "Two";
    Get.defaultDialog(
      title: " Congretulation 👏👏",
      titlePadding: EdgeInsets.all(20),
      middleText: "😎😎 Player $winningPlayer 😎😎",
      barrierDismissible: false,
      confirm: Row(
        children: [
          Expanded(child: Container()),
          GestureDetector(
            onTap: () {
              print("Confrim");
              startOverNew();
            },
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
    //  clearAllValue();
  }

  logicOne() {
    if (itemList[0] == itemList[3] && itemList[3] == itemList[6]) {
      winningDialog(itemList[0]);
    }
    return;
  }

  logicTwo() {
    if (itemList[1] == itemList[4] && itemList[4] == itemList[7]) {
      winningDialog(itemList[1]);
    }
    return;
  }

  logicThree() {
    if (itemList[2] == itemList[5] && itemList[5] == itemList[8]) {
      winningDialog(itemList[2]);
    }
    return;
  }

  logicFour() {
    if (itemList[0] == itemList[1] && itemList[1] == itemList[2]) {
      winningDialog(itemList[0]);
    }
    return;
  }

  logicFive() {
    if (itemList[3] == itemList[4] && itemList[4] == itemList[5]) {
      winningDialog(itemList[3]);
    }
    return;
  }

  logicSix() {
    if (itemList[6] == itemList[7] && itemList[7] == itemList[8]) {
      winningDialog(itemList[6]);
    }
    return;
  }

  logicSeven() {
    if (itemList[0] == itemList[4] && itemList[4] == itemList[8]) {
      winningDialog(itemList[0]);
    }
    return;
  }

  logicEight() {
    if (itemList[2] == itemList[4] && itemList[4] == itemList[6]) {
      winningDialog(itemList[2]);
    }
    return;
  }

  winningLogic(index) {
    if (index == 0) {
      logicOne();
      logicFour();
      logicSeven();
      return;
    }
    if (index == 1) {
      logicTwo();
      logicFour();
      return;
    }
    if (index == 2) {
      logicThree();
      logicFour();
      logicEight();
      return;
    }
    if (index == 3) {
      logicOne();
      logicFive();
      return;
    }
    if (index == 4) {
      logicTwo();
      logicFive();
      logicSeven();
      return;
    }
    if (index == 5) {
      logicThree();
      logicFive();
      return;
    }
    if (index == 6) {
      logicOne();
      logicEight();
      return;
    }
    if (index == 7) {
      logicTwo();
      logicSix();
      return;
    }
    if (index == 8) {
      logicThree();
      logicSix();
      logicSeven();
      return;
    }
    return;
  }

  clearAllValue() {
    for (var i = 0; i < itemList.length; i++) {
      itemList[i] = null;
    }
  }
}


