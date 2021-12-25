
import 'package:tic_tac_toe/Core/Veriable.dart';
import 'package:tic_tac_toe/Use_Cases/Winning_Function_Check.dart';

class CheckWinner {
  final  gameController;

  CheckWinner(this.gameController);

  logicOne() {
    final bool _result = winningCheck(itemList[0], itemList[3], itemList[6]);
    if (_result) {
      gameController.winningDialog(itemList[0]);
    }
    return;
  }

  logicTwo() {
    final bool _result = winningCheck(itemList[1], itemList[4], itemList[7]);
    if (_result) {
      gameController.winningDialog(itemList[0]);
    }
    return;
  }

  logicThree() {
    final bool _result = winningCheck(itemList[2], itemList[5], itemList[8]);
    if (_result) {
      gameController.winningDialog(itemList[0]);
    }
    return;
  }

  logicFour() {
    final bool _result = winningCheck(itemList[0], itemList[1], itemList[2]);
    if (_result) {
      gameController.winningDialog(itemList[0]);
    }
    return;
  }

  logicFive() {
    final bool _result = winningCheck(itemList[3], itemList[4], itemList[5]);
    if (_result) {
      gameController.winningDialog(itemList[0]);
    }
    return;
  }

  logicSix() {
    final bool _result = winningCheck(itemList[6], itemList[7], itemList[8]);
    if (_result) {
      gameController.winningDialog(itemList[0]);
    }
    return;
  }

  logicSeven() {
    final bool _result = winningCheck(itemList[0], itemList[4], itemList[8]);
    if (_result) {
      gameController.winningDialog(itemList[0]);
    }
    return;
  }

  logicEight() {
    final bool _result = winningCheck(itemList[2], itemList[4], itemList[6]);
    if (_result) {
      gameController.winningDialog(itemList[0]);
    }
    return;
  }
}
