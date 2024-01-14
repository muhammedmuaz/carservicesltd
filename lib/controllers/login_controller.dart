import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
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
    print(emailController.text);
    print(response);
    if (response != null) {
      try {
        await Api().sp.write("islogin", '1');
        await Api().sp.write("user_login", emailController.text);
      } catch (e) {
        BotToast.showText(text: 'Error');
      }
      signUpButtonController.success();
      Timer(const Duration(seconds: 1), () => Get.offAllNamed('/home'));
    } else {
      signUpButtonController.error();
      Timer(const Duration(seconds: 2), () => signUpButtonController.stop());
    }
  }
}
