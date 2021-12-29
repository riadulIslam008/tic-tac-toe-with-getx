import 'package:tic_tac_toe/Core/Veriable.dart';
import 'package:tic_tac_toe/Use_Cases/Winning_Function_Check.dart';

class CheckWinner {
  String winnerPerson = "NONE";

  logicOne() {
    final bool _result = winningCheck(itemList[0], itemList[3], itemList[6]);
    if (_result) {
      winnerPerson = itemList[0];
    }
    return winnerPerson;
  }

  logicTwo() {
    final bool _result = winningCheck(itemList[1], itemList[4], itemList[7]);
    if (_result) {
      winnerPerson = itemList[1];
    }
    return winnerPerson;
  }

  logicThree() {
    final bool _result = winningCheck(itemList[2], itemList[5], itemList[8]);
    if (_result) {
      winnerPerson = itemList[2];
    }
    return winnerPerson;
  }

  logicFour() {
    final bool _result = winningCheck(itemList[0], itemList[1], itemList[2]);
    if (_result) {
      winnerPerson = itemList[0];
    }
    return winnerPerson;
  }

  logicFive() {
    final bool _result = winningCheck(itemList[3], itemList[4], itemList[5]);
    if (_result) {
      winnerPerson = itemList[3];
    }

    return winnerPerson;
  }

  logicSix() {
    final bool _result = winningCheck(itemList[6], itemList[7], itemList[8]);
    if (_result) {
      winnerPerson = itemList[6];
    }

    return winnerPerson;
  }

  logicSeven() {
    final bool _result = winningCheck(itemList[0], itemList[4], itemList[8]);
    if (_result) {
      winnerPerson = itemList[0];
    }
    return winnerPerson;
  }

  logicEight() {
    final bool _result = winningCheck(itemList[2], itemList[4], itemList[6]);
    if (_result) {
      winnerPerson = itemList[2];
    }
    return winnerPerson;
  }
}
