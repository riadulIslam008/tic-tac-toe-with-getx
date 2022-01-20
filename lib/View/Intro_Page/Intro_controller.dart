import 'package:get/get.dart';
import 'package:tic_tac_toe/Services/Ad_Provider.dart';
import 'package:tic_tac_toe/Services/App_ShortcutItem.dart';

class IntroController extends GetxController {

  final AdProvider adProvider = AdProvider();
  final AppShortcut appShortcut = AppShortcut();
  RxBool isHomepageBanner = false.obs;

  @override
  void onInit() {
    loadBannerAd();
    appShortcut.initQuickAction();
    super.onInit();
  }

  Future<void> loadBannerAd() async {
    try {
      await adProvider.initializeHomepageBanner();
      isHomepageBanner.value = true;
    } catch (e) {
      isHomepageBanner.value = false;
    }
  }

  @override
  void onClose() {
    AdProvider.homePageBanner.dispose();
    super.onClose();
  }
}
