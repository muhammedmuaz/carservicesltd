import 'dart:async';
import 'dart:convert';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:services_app/network/Api.dart';
import 'package:http/http.dart' as http;

class loginController extends GetxController {
  RxBool isloading = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final RoundedLoadingButtonController signUpButtonController =
      RoundedLoadingButtonController();

  forgot() async {
    String url =
        'api/user/retrieve_password/?user_login=${emailController.text}';
    final response = await http.post(Uri.parse(apiUrl + url),
        body: jsonEncode({"user_login": emailController.text}));
    final body = response.body;
    final jsonResponse = jsonDecode(body.split("</script>").last.toString());
    print(jsonResponse);
    final apiResponse = jsonResponse;
    if (response.statusCode == 200) {
      BotToast.showText(text: apiResponse['error']);
      emailController.clear();
      signUpButtonController.success();
      Timer(const Duration(seconds: 2), () => signUpButtonController.stop());
    } else {
      try {
        emailController.clear();
        signUpButtonController.error();
        Timer(const Duration(seconds: 2), () => signUpButtonController.stop());
        BotToast.showText(text: apiResponse['msg']);
      } catch (e) {
        BotToast.showText(text: 'Error please Try Again');
      }
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

  signup() async {
    String nonceUrl =
        '/api/get_nonce/?json=get_nonce&controller=users&method=create_user';

    final nonceResponse = await http.post(Uri.parse("$apiUrl$nonceUrl"));

    final nonce = nonceResponse.body;
    final jsonResponse = jsonDecode(nonce.split("</script>").last);
    print(jsonResponse['nonce']);

    String url =
        "/api/users/create_user/?u=maazzindani2003@gmail.com&p=K9gn\$WlDTwfaS\$EFTf9ly^34&user_login=${emailController.text}&user_password=${passController.text}&user_email=${emailController.text}&nonce=${jsonResponse['nonce']}";
    // jsonDecode(nonce);
    // print(nonce.f);

    // String url = 'api/users/login/';
    final response = await http.post(Uri.parse("$apiUrl$url"));
    final jsonResponseSignUp =
        jsonDecode(response.body.split("</script>").last);

    if (jsonResponseSignUp['status'] == 'ok') {
      signUpButtonController.success();
      Timer(const Duration(seconds: 1), () => Get.offAllNamed('/home'));
      await Api().sp.write("islogin", '1');
      await Api().sp.write("user_login", emailController.text);
    } else {
      signUpButtonController.error();
      Timer(const Duration(seconds: 2), () => signUpButtonController.stop());
    }
    // // final response = await Api().post({
    // //   "user_login": emailController.text,
    // //   "user_password": passController.text
    // // }, url, postButton: signUpButtonController);
    // print(emailController.text);
    // print(response);
    // if (response.statusCode != 400) {
    //   try {
    //     await Api().sp.write("islogin", '1');
    //     await Api().sp.write("user_login", emailController.text);
    //   } catch (e) {
    //     BotToast.showText(text: 'Error');
    //   }
    //   signUpButtonController.success();
    //   Timer(const Duration(seconds: 1), () => Get.offAllNamed('/home'));
    // } else {
    //   signUpButtonController.error();
    //   Timer(const Duration(seconds: 2), () => signUpButtonController.stop());
    // }
  }
}
