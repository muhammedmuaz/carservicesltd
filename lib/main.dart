import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services_app/views/carrental/carrental_page.dart';
import 'package:services_app/views/home/homepage.dart';
import 'package:services_app/views/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CarServicesLtd',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
