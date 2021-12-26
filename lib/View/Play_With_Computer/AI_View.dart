import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/View/Play_With_Computer/Ai_View_Controller.dart';
import 'package:tic_tac_toe/View/Play_With_Computer/Widgets/Ai_Game_Board.dart';
import 'package:tic_tac_toe/View/Play_With_Friend/Widgets/Reset_Button.dart';

class AiView extends GetWidget<AiViewController> {
  const AiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Play with Computer"),
          actions: [
            resetButton(() => controller.clearAll()),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GetBuilder<AiViewController>(
              builder: (controller) => AiGameBoard(),
            ),
          ),
        ));
  }
}
