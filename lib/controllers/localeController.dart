import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocaleController extends GetxController {
  final locale = 'en'.obs;

  Future<void> init() async {
    await GetStorage.init();
    String savedLocale = GetStorage().read('locale');
    if (savedLocale != null) {
      changeLocale(savedLocale);
    }
  }

  void changeLocale(String newLocale) {
    locale(newLocale);
    GetStorage().write('locale', newLocale);
    Get.updateLocale(Locale(newLocale));
  }

  static LocaleController to = Get.find();
}