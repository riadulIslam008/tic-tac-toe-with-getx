import 'package:get/get.dart';
import 'package:tic_tac_toe/Routes/App_Routes.dart';
import 'package:tic_tac_toe/View/Intro_Page/Intro_Page.dart';
import 'package:tic_tac_toe/View/Play_With_Computer/AI_View.dart';
import 'package:tic_tac_toe/View/Play_With_Friend/Play_With_Friend_View.dart';

class AppPages {
  static const INITAL_ROUTE = "/";

  static final routes = [
    GetPage(name: INITAL_ROUTE, page: ()=> IntroPage(), transition: Transition.zoom),
    GetPage(name: Routes.PLAY_WITH_FRIEND, page: () => PlayWithFriendView(), transition: Transition.zoom),
    GetPage(name: Routes.PLAY_WITH_System, page: () => AiView(), transition: Transition.zoom),
  ];
}
