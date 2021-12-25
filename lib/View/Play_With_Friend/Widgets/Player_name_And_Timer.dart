import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Core/Color.dart';

class PlayerNameandTimer extends StatelessWidget {
  PlayerNameandTimer(
      {Key? key,
      required this.playerController,
      required this.playerTime,
      required this.playerName,
      required this.playerChange})
      : super(key: key);
  final String playerName;
  final bool playerController;
  final bool playerChange;
  final int playerTime;

  final SizedBox _width = SizedBox(width: 10);
  final TextStyle _style = TextStyle(color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      height: 40,
      color: playerController && playerChange ? _playerOne() : _playerTwo(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.person, color: Colors.white),
          _width,
          Text(
            playerName,
            style: _style,
          ),
          _width,
          Text(
            "00 : 0${playerTime.toString()}",
            style: TextStyle(
              color: playerController ? _whiteText() : _redText(),
              fontSize: playerController ? _textSize25() : _textSize20(),
            ),
          ),
        ],
      ),
    );
  }

  _playerOne() {
    return playerChange ? GREEN_COLOR : GREY_COLOR;
  }

  _playerTwo() {
    return playerChange ? GREEN_COLOR : GREY_COLOR;
  }

  _redText() {
    return playerChange ? Colors.red : Colors.white;
  }

  _whiteText() {
    return playerChange ? Colors.red : Colors.white;
  }

  double _textSize20() {
    return playerChange ? 25.0 : 20.0;
  }

  double _textSize25() {
    return playerChange ? 25.0 : 20.0;
  }
}
