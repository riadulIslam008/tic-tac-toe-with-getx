import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/Bindings/Binding.dart';
import 'package:tic_tac_toe/Routes/App_Pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     initialBinding: Binding(),
      title: "Tic Tac Toe",
      getPages: AppPages.routes,
      initialRoute: AppPages.INITAL_ROUTE,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
     // home: SafeArea(child: IntroPage()),
    );
  }
}

