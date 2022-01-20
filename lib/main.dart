import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:tic_tac_toe/Bindings/Binding.dart';
import 'package:tic_tac_toe/Routes/App_Pages.dart';

void main() {
  //for ads
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  //     .then((status) {
  //   MobileAds.instance.updateRequestConfiguration(RequestConfiguration(
  //       testDeviceIds: ["A59BC0A4D095741988D8CE742326859D"]));
  // });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //disable Landsceape mode
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return GetMaterialApp(
      initialBinding: Binding(),
      title: "Tic Tac Toe",
      getPages: AppPages.routes,
      initialRoute: AppPages.INITAL_ROUTE,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
