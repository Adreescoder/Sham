import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sham/screens/profile/view.dart';
import 'package:sham/screens/signup/logic.dart';
import 'package:sham/screens/signup/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sham".toUpperCase(),
      home: SignupPage(),
    );
  }
}
