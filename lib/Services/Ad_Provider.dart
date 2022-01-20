import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:tic_tac_toe/Services/Ad_Helper.dart';

class AdProvider {
  static const int maxLoadNumber = 3;
  int _loadCount = 0;
  static late BannerAd homePageBanner;
  static late BannerAd aiPageBanner;
  static InterstitialAd? fullpageAd;
  static bool fullPageLoad = false;

  Future<void> initializeHomepageBanner() async {
    homePageBanner = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.homepageBannnerId,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          // print("Ad Loaded");
        },
        onAdClosed: (ad) {
          ad.dispose();
        },
        onAdFailedToLoad: (ad, error) {
          // print("A Error $error");
          ad.dispose();
        },
      ),
    );
    await homePageBanner.load();
  }

  Future<void> initializeAipageBanner() async {
    aiPageBanner = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.aipageBannnerId,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {},
        onAdClosed: (ad) {
          ad.dispose();
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    await aiPageBanner.load();
  }

  Future<void> initializefullpageInterstialAd() async {
    await InterstitialAd.load(
      adUnitId: AdHelper.fullpageAd,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdFailedToLoad: (error) {
          //  print("Full Page Error $error");
          fullpageAd = null;
          fullPageLoad = false;
          _loadCount++;
          if (_loadCount > maxLoadNumber) initializefullpageInterstialAd();
        },
        onAdLoaded: (ad) {
          fullpageAd = ad;
          fullPageLoad = true;
          _loadCount = 0;
        },
      ),
    );
  }
}
