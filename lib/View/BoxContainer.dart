import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/Controller/GamesController.dart';

class BoxContainer extends StatelessWidget {
  final bool bottomWidth;
  final bool rightWidth;
  final int index;
  final Color blackColor = Colors.black;
  final Color greyColor = Colors.grey[350]!;
  final TextStyle _style = TextStyle(
    color: Colors.black,
    fontSize: 50,
    fontWeight: FontWeight.bold,
  );

  BoxContainer({
    Key? key,
    this.bottomWidth = true,
    this.rightWidth = true,
    required this.index,
  }) : super(key: key);
  final double _width = 5;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameController>(
      init: GameController(),
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.changeValue(index);
          },
          child: Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: rightWidth ? blackColor : greyColor,
                  width: _width,
                ),
                bottom: BorderSide(
                  color: bottomWidth ? blackColor : greyColor,
                  width: _width,
                ),
              ),
            ),
            child: controller.itemList[index] == null
                ? Container()
                : Center(
                    child: Text(controller.itemList[index], style: _style)),
          ),
        );
      },
    );
  }
}
