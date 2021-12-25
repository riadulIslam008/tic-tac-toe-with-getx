import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/View/Play_With_Computer/Ai_View_Controller.dart';
import 'package:tic_tac_toe/View/Play_With_Computer/Widgets/Ai_Box.dart';
import 'package:tic_tac_toe/View/Widgets/Box_Container.dart';

class AiGameBoard extends StatelessWidget {
  AiGameBoard({Key? key}) : super(key: key);

  final AiViewController _aiViewController = Get.find<AiViewController>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 9,
      itemBuilder: (context, index) {
        if (index == 2 || index == 5)
          return BoxContainer(
            rightWidth: false,
            index: index,
            onPressed: () => _aiViewController.changeValue(index),
          );
        if (index == 6 || index == 7)
          return BoxContainer(
            bottomWidth: false,
            index: index,
            onPressed: () => _aiViewController.changeValue(index),
          );
        if (index == 8)
          return BoxContainer(
            bottomWidth: false,
            rightWidth: false,
            index: index,
            onPressed: () => _aiViewController.changeValue(index),
          );
        return BoxContainer(
          index: index,
          onPressed: () => _aiViewController.changeValue(index),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
    );
  }
}
