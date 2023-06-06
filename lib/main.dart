import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services_app/views/carrental/carrental_page.dart';
import 'package:services_app/views/home/homepage.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: CarRentalPage(),
    );
  }
}
