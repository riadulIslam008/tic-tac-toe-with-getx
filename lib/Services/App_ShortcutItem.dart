import 'package:get/get.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:tic_tac_toe/Routes/App_Routes.dart';

class AppShortcut {
  late QuickActions quickActions;

  void initQuickAction() {
    quickActions = QuickActions();
    quickActions.setShortcutItems(
      [
        ShortcutItem(type: "AiPage", localizedTitle: "Play with computer", icon: "ic_launcher"),
        ShortcutItem(type: "friend", localizedTitle: "Play with friend", icon: "ic_launcher"),
      ],
    );
    quickActions.initialize(
      (type) {
        if (type == "AiPage") {
          Get.to(Routes.PLAY_WITH_System);
        } else if (type == "friend") {
          Get.to(Routes.PLAY_WITH_FRIEND);
        }
      },
    );
  }
}
