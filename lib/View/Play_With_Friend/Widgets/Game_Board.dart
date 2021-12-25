import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/View/Play_With_Friend/GamesController.dart';
import 'package:tic_tac_toe/View/Widgets/Box_Container.dart';

class GameBoard extends StatelessWidget {
  GameBoard({Key? key}) : super(key: key);

 // final GameController gameController = Get.find<GameController>();

  @override
  Widget build(BuildContext context) {

    return GetBuilder<GameController>(
      builder: (gameController) => GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 9,
        itemBuilder: (context, index) {
          if (index == 2 || index == 5)
            return BoxContainer(
                rightWidth: false,
                index: index,
                onPressed: () => gameController.changeValue(index));
          if (index == 6 || index == 7)
            return BoxContainer(
                bottomWidth: false,
                index: index,
                onPressed: () => gameController.changeValue(index));
          if (index == 8)
            return BoxContainer(
                bottomWidth: false,
                rightWidth: false,
                index: index,
                onPressed: () => gameController.changeValue(index));
          return BoxContainer(
            index: index,
            onPressed: () => gameController.changeValue(index),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
      ),
    );
  }
}
