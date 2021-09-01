import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/Controller/Bindings/Binding.dart';
import 'package:tic_tac_toe/View/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     initialBinding: Binding(),
      title: "Tic Tac Toe",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

