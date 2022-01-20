import 'package:get/get.dart';
import 'package:tic_tac_toe/View/Intro_Page/Intro_controller.dart';
import 'package:tic_tac_toe/View/Play_With_Computer/Ai_View_Controller.dart';
import 'package:tic_tac_toe/View/Play_With_Friend/GamesController.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroController>(() => IntroController(), fenix: true);
    Get.lazyPut<GameController>(() => GameController(), fenix: true);
    Get.lazyPut<AiViewController>(() => AiViewController(), fenix: true);
  }
}
