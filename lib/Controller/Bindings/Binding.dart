import 'package:get/get.dart';
import 'package:tic_tac_toe/Controller/GamesController.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameController>(() => GameController());
  }
}
