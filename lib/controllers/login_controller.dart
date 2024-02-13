import 'dart:async';
import 'dart:convert';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:services_app/network/Api.dart';
import 'package:http/http.dart' as http;

class loginController extends GetxController {
  RxBool isloading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final RoundedLoadingButtonController signUpButtonController =
      RoundedLoadingButtonController();

  forgot() async {
    String url = 'api/user/retrieve_password/';
    final response = await http.post(Uri.parse(apiUrl + url),
        body: jsonEncode({"user_login": emailController.text}));
    final apiResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      BotToast.showText(text: apiResponse['msg']);
      emailController.clear();
      signUpButtonController.success();
      Timer(const Duration(seconds: 2), () => signUpButtonController.stop());
    } else {
      emailController.clear();
      signUpButtonController.error();
      Timer(const Duration(seconds: 2), () => signUpButtonController.stop());
      BotToast.showText(text: 'Error please Try Again');
    }
  }

  login() async {
    String url = 'api/users/login/';
    final response = await http.post(Uri.parse(
        "$apiUrl$url?user_login=${emailController.text}&user_password=${passController.text}"));
    // final response = await Api().post({
    //   "user_login": emailController.text,
    //   "user_password": passController.text
    // }, url, postButton: signUpButtonController);
    print(emailController.text);
    print(response);
    if (response.statusCode != 400) {
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
