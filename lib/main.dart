import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:services_app/network/Api.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Routes/app_pages.dart';

// Requesting Permission
Future<void> requestPermission() async {
  final permissionStatus = await Permission.location.request();

  if (permissionStatus.isGranted) {
    getLocation();
  } else {}
}

final LocalAuthentication localAuth = LocalAuthentication();

Future<void> saveFingerprint() async {
  final LocalAuthentication localAuth = LocalAuthentication();
  bool canCheckBiometrics = await localAuth.canCheckBiometrics;
  if (canCheckBiometrics) {
    List<BiometricType> availableBiometrics =
        await localAuth.getAvailableBiometrics();
    if (availableBiometrics.contains(BiometricType.fingerprint)) {
      // Prompt the user to save their fingerprint
      bool didAuthenticate = await localAuth.authenticate(
        localizedReason: 'Save your fingerprint to secure the app',
      );
      if (didAuthenticate) {
        // Fingerprint saved successfully
        // You can store this information securely for future use
      }
    }
  }
}

Future<void> launchUrlfunc(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

void getLocation() async {
  try {
    position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  } catch (e) {
    return;
  }

  // Do something with the obtained position
  print('Latitude: ${position!.latitude}');
  print('Longitude: ${position!.longitude}');
}

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  requestPermission(); // Call this function to request permission when the app opens.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // translations: localString(),
      // localeResolutionCallback: (deviceLocale, supportedLocales) {
      //   for (var locale in supportedLocales) {
      //     if (locale.languageCode == deviceLocale!.languageCode &&
      //         locale.countryCode == deviceLocale.countryCode) {
      //       return deviceLocale;
      //     }
      //   }
      //   return supportedLocales.first;
      // },
      // localizationsDelegates: [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   // Additional delegates as needed.
      // ],
      // supportedLocales: [
      //   Locale('hi', 'IN'),
      //   Locale('es', 'ES'),
      //   Locale('de', 'DE'),
      //   Locale('fr', 'FR'),
      // ],
      // locale: const Locale('hi', 'IN'),
      title: 'CarServicesLtd',
      transitionDuration: const Duration(milliseconds: 200),
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      debugShowCheckedModeBanner: false,
      // home: EditProfilePage(),
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
    );
  }
}
