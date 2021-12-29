import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/Routes/App_Routes.dart';
import 'package:tic_tac_toe/View/Intro_Page/Widgets/Custome_Painter.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleWithTitle(
                titleText: "Play With Friend",
                onPressed: Routes.PLAY_WITH_FRIEND),
            CircleWithTitle(
                titleText: "Play With Computer",
                onPressed: Routes.PLAY_WITH_System),
          ],
        ),
      ),
    );
  }
}

class CircleWithTitle extends StatefulWidget {
  const CircleWithTitle(
      {Key? key, required this.titleText, required this.onPressed})
      : super(key: key);
  final String titleText;
  final String onPressed;

  @override
  State<CircleWithTitle> createState() => _CircleWithTitleState();
}

class _CircleWithTitleState extends State<CircleWithTitle>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(widget.onPressed),
      onLongPressDown: (_) {
        animationController.forward();
      },
      onLongPressUp: () {
        if (animationController.status != AnimationStatus.completed) {
          animationController.reverse();
        }
      },
      onLongPressCancel: () {
        if (!animationController.isCompleted) {
          animationController.reverse();
        }
      },
      child: SizedBox(
        width: 240,
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) => Stack(
            children: [
              CircleUI(
                progressStroke: animationController.value,
              ),
              Positioned.fill(
                child: Center(
                  child: FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        widget.titleText,
                        style: TextStyle(
                          fontSize: 20,
                          color: animationController.value < 1
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
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