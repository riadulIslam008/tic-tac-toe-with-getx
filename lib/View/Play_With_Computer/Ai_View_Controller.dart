import 'package:get/get.dart';
import 'package:tic_tac_toe/Core/Veriable.dart';
import 'package:tic_tac_toe/Services/Ad_Provider.dart';
import 'package:tic_tac_toe/Use_Cases/Ai/Mini_Max_Algo.dart';
import 'package:tic_tac_toe/Use_Cases/Check_Wining_Index.dart';
import 'package:tic_tac_toe/Use_Cases/Winnning_Dialog.dart';

class AiViewController extends GetxController {
  final AdProvider adProvider = AdProvider();
  RxBool isAipageBanner = false.obs;

  @override
  void onInit() {
    loadBannerAd();
    loadInterstialAd();
    super.onInit();
  }

  Future<void> loadBannerAd() async {
    try {
      await adProvider.initializeAipageBanner();

      isAipageBanner.value = true;
    } catch (e) {
      isAipageBanner.value = false;
    }
  }

  Future<void> loadInterstialAd() async {
    try {
      await adProvider.initializefullpageInterstialAd();
    } catch (e) {
      print(e);
    }
  }

  clearAll() {
    for (var i = 0; i < itemList.length; i++) {
      itemList[i] = null;
    }
    update();
  }

  void winningDialog(String item) {
    aiWinningMessage(() => startOverNew(), item);
  }

  void changeValue(int index) {
    if (itemList[index] == null) {
      itemList[index] = HUMAN;
      update();
      //Match Draw Dialog
      int spot = 0;
      for (int i = 0; i < itemList.length; i++) {
        if (itemList[i] == null) spot++;
      }
      if (spot == 0) winningDialog("NONE");
      String winnerName;

      int? bestMove;

      // Ai move
      int bestScore = -999999999;
      for (int i = 0; i < itemList.length; i++) {
        if (itemList[i] == null) {
          itemList[i] = AI_MOVE;
          final score = minimaxAlgo(false, itemList, -9999999, 999999999);

          itemList[i] = null;
          if (score > bestScore) {
            bestScore = score;
            bestMove = i;
          }
        }
      }
      if (bestMove != null) itemList[bestMove] = AI_MOVE;
      update();
      winnerName = winningLogic(bestMove);
      if (winnerName == AI_MOVE)
        aiWinningMessage(() => startOverNew(), winnerName);
    }
  }

  startOverNew() {
    clearAll();
    Get.back();
  }

  @override
  void onClose() {
    clearAll();
    AdProvider.aiPageBanner.dispose();
    if (AdProvider.fullPageLoad) AdProvider.fullpageAd!.dispose();
    super.dispose();
  }
}
