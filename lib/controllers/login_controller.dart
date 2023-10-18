import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:services_app/network/Api.dart';

class loginController extends GetxController {
  RxBool isloading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final RoundedLoadingButtonController signUpButtonController =
      RoundedLoadingButtonController();
  login() async {
    String url = 'api/users/login/';
    final response = await Api().post({
      "user_login": emailController.text,
      "user_password": passController.text
    }, url, postButton: signUpButtonController);
    if (response != null) {
      try {
        await Api().sp.write("islogin", '1');
        print(Api().sp.read('islogin').runtimeType);
        print(Api().sp.read('islogin').runtimeType);
      } catch (e) {
        print(e);
      }
      signUpButtonController.success();
      Get.offAllNamed('/home');
    } else {
      signUpButtonController.error();
      Timer(const Duration(seconds: 2), () => signUpButtonController.stop());
    }
  }
}
