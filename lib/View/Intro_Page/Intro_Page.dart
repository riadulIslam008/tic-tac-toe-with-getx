import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:tic_tac_toe/Routes/App_Routes.dart';
import 'package:tic_tac_toe/Services/Ad_Provider.dart';
import 'package:tic_tac_toe/View/Intro_Page/Intro_controller.dart';
import 'package:tic_tac_toe/View/Intro_Page/Widgets/CircleWith_Title.dart';

class IntroPage extends GetWidget<IntroController> {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleWithTitle(
                  titleText: "Play With Friend",
                  onPressed: Routes.PLAY_WITH_FRIEND,
                  circleRadius: constraints.maxWidth * 0.60),
              CircleWithTitle(
                  titleText: "Play With Computer",
                  circleRadius: constraints.maxWidth * 0.60,
                  onPressed: Routes.PLAY_WITH_System),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => controller.isHomepageBanner.value
            ? Container(
                height: AdProvider.homePageBanner.size.height.toDouble(),
                width: AdProvider.homePageBanner.size.width.toDouble(),
                child: AdWidget(
                  ad: AdProvider.homePageBanner,
                ),
              )
            : SizedBox.shrink(),
      ),
    );
  }
}
