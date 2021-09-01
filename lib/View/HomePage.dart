import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/Controller/GamesController.dart';
import 'package:tic_tac_toe/View/BoxContainer.dart';

class HomePage extends GetWidget<GameController> {
  final Color greenColor = Colors.green;
  final Color greyColor = Colors.grey;
  final TextStyle _style = TextStyle(color: Colors.white);

  final SizedBox _width = SizedBox(width: 10);
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
                () => Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 40,
                  color: controller.playerController.value
                      ? greenColor
                      : greyColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.person, color: Colors.white),
                      _width,
                      Text(
                        "PLAYER ONE",
                        style: _style,
                      ),
                      _width,
                      Text(
                        "00 : 0${controller.playerOneTimer.value.toString()}",
                        style: TextStyle(
                          color: controller.playerController.value
                              ? Colors.red
                              : Colors.white,
                          fontSize: controller.playerController.value ? 20 : 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      if (index == 2 || index == 5)
                        return BoxContainer(rightWidth: false, index: index);
                      if (index == 6 || index == 7)
                        return BoxContainer(bottomWidth: false, index: index);
                      if (index == 8)
                        return BoxContainer(
                            bottomWidth: false,
                            rightWidth: false,
                            index: index);
                      return BoxContainer(index: index);
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerRight,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.teal,
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            controller.startOverNew();
                          },
                          icon: Icon(Icons.restart_alt, size: 29),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Obx(
                () => Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: 40,
                  color: controller.playerController.value
                      ? greyColor
                      : greenColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.person, color: Colors.white),
                      _width,
                      Text(
                        "PLAYER TWO",
                        style: _style,
                      ),
                      _width,
                      Text(
                        "00 : 0${controller.playerTwoTimer.value.toString()}",
                        style: TextStyle(
                          color: controller.playerController.value
                              ? Colors.white
                              : Colors.red,
                          fontSize: controller.playerController.value ? 20 : 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
