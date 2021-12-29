import 'package:tic_tac_toe/Use_Cases/Winner_Check.dart';

winningLogic(index) {
  String winnerName = "NONE";
  CheckWinner _checkWinner = CheckWinner();
  if (index == 0) {
    winnerName = _checkWinner.logicFour();
    winnerName = _checkWinner.logicSeven();
    winnerName = _checkWinner.logicOne();
    return winnerName;
  }
  if (index == 1) {
    winnerName = _checkWinner.logicTwo();
    winnerName = _checkWinner.logicFour();
    return winnerName;
  }
  if (index == 2) {
    winnerName = _checkWinner.logicThree();
    winnerName = _checkWinner.logicFour();
    winnerName = _checkWinner.logicEight();
    return winnerName;
  }
  if (index == 3) {
    winnerName = _checkWinner.logicOne();
    winnerName = _checkWinner.logicFive();
    return winnerName;
  }
  if (index == 4) {
    winnerName = _checkWinner.logicTwo();
    winnerName = _checkWinner.logicFive();
    winnerName = _checkWinner.logicSeven();
    return winnerName;
  }
  if (index == 5) {
    winnerName = _checkWinner.logicThree();
    winnerName = _checkWinner.logicFive();
    return winnerName;
  }
  if (index == 6) {
    winnerName = _checkWinner.logicOne();
    winnerName = _checkWinner.logicEight();
    return winnerName;
  }
  if (index == 7) {
    winnerName = _checkWinner.logicSix();
    winnerName = _checkWinner.logicTwo();
    return winnerName;
  }
  if (index == 8) {
    winnerName = _checkWinner.logicThree();
    winnerName = _checkWinner.logicSix();
    winnerName = _checkWinner.logicSeven();
    return winnerName;
  }
  return winnerName;
}
