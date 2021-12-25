 import 'package:tic_tac_toe/Use_Cases/Winner_Check.dart';

winningLogic(index,dynamic controller) {
    
    CheckWinner _checkWinner = CheckWinner(controller);
    if (index == 0) {
      _checkWinner.logicOne();
      _checkWinner.logicFour();
      _checkWinner.logicSeven();
      return;
    }
    if (index == 1) {
      _checkWinner.logicTwo();
      _checkWinner.logicFour();
      return;
    }
    if (index == 2) {
      _checkWinner.logicThree();
      _checkWinner.logicFour();
      _checkWinner.logicEight();
      return;
    }
    if (index == 3) {
      _checkWinner.logicOne();
      _checkWinner.logicFive();
      return;
    }
    if (index == 4) {
      _checkWinner.logicTwo();
      _checkWinner.logicFive();
      _checkWinner.logicSeven();
      return;
    }
    if (index == 5) {
      _checkWinner.logicThree();
      _checkWinner.logicFive();
      return;
    }
    if (index == 6) {
      _checkWinner.logicOne();
      _checkWinner.logicEight();
      return;
    }
    if (index == 7) {
      _checkWinner.logicSix();
      _checkWinner.logicTwo();
      return;
    }
    if (index == 8) {
      _checkWinner.logicThree();
      _checkWinner.logicSix();
      _checkWinner.logicSeven();
      return;
    }
    return;
  }