import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:services_app/lat_long.dart';
import 'package:services_app/network/Api.dart';

import 'package:services_app/views/carrental/carrental_page.dart';
import 'package:services_app/views/home/homepage.dart';
import 'package:services_app/views/login/login_page.dart';
import 'package:permission_handler/permission_handler.dart';

// Requesting Permission
Future<void> requestPermission() async {
  // Request location permission
  final permissionStatus = await Permission.location.request();

  if (permissionStatus.isGranted) {
    // Permission granted, proceed with getting the location
    getLocation();
  } else {
    // Permission denied, handle accordingly (e.g., show an error message)
  }
}

void getLocation() async {
  try {
    position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  } catch (e) {
    // Handle any errors that occurred during location retrieval
    print(e.toString());
    return;
  }

  // Do something with the obtained position
  print('Latitude: ${position!.latitude}');
  print('Longitude: ${position!.longitude}');
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  requestPermission(); // Call this function to request permission when the app opens.
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
