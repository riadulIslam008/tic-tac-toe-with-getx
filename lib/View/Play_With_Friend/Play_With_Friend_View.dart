import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/View/Play_With_Friend/GamesController.dart';
import 'package:tic_tac_toe/View/Play_With_Friend/Widgets/Game_Board.dart';
import 'package:tic_tac_toe/View/Play_With_Friend/Widgets/Player_name_And_Timer.dart';

class PlayWithFriendView extends GetWidget<GameController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.grey[350],
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => PlayerNameandTimer(
                    playerChange: controller.playerChange.value,
                    playerName: "PLAYER ONE",
                    playerController: controller.playerController.value,
                    playerTime: controller.playerOneTimer.value),
              ),
              Column(
                children: [
                  GameBoard(),
                ],
              ),
              Obx(
                () => PlayerNameandTimer(
                    playerChange: !controller.playerChange.value,
                    playerName: "PLAYER TWO",
                    playerController: controller.playerController.value,
                    playerTime: controller.playerTwoTimer.value),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
