import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:services_app/network/Api.dart';
import 'package:services_app/utils/carservices_fingerprint.dart';
import 'package:services_app/views/Add/post_an_add.dart';
import 'package:url_launcher/url_launcher.dart';

import '../views/login/forgot_Password.dart';
import '../views/login/login_page.dart';
import '../views/webview/chat_with_us_page.dart';

class CarServicesPopUpMenu extends StatelessWidget {
  const CarServicesPopUpMenu({super.key});
  @override
  Widget build(BuildContext context) {
    final CarServicesFingerprintLock _fingerprintLockService =
        CarServicesFingerprintLock();
    return PopupMenuButton(
      elevation: 5,
      // color: Colors.amber,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      icon: const Icon(Icons.menu, color: Colors.black),
      onSelected: (value) async {
        if (value == 'editprofile') {
          Get.toNamed('/editProfilePage');
        } else if (value == 'subscription') {
          Get.toNamed('/subscriptionPage');
        } else if (value == 'secureApp') {
          Get.defaultDialog(
              title: "Secure my App",
              content: const Text(
                  "Do you want to secure your app using your fingerprint?"),
              onCancel: () => Get.back(),
              onConfirm: () async {
                Api().sp.write('fingerprint', '1');
                Get.back(); // Close the dialog
                BotToast.showText(text: 'Fingerprint Added in your App');
              },
              textCancel: "No",
              textConfirm: "Yes",
              confirmTextColor: Colors.white);
        } else if (value == 'login') {
          Get.offAllNamed('/login');
        } else if (value == 'postAnAdd') {
          Get.to(const AddPostPage());
        } else if (value == 'changePassword') {
          Get.to(const ForgtPasswordScreen(
            isChangePass: true,
          ));
        } else if (value == 'changePassword') {
          Get.to(const ForgtPasswordScreen(
            isChangePass: true,
          ));
        } else if (value == 'chatWithUs') {
          Get.to(const ChatWithUs());
        } else if (value == 'logOut') {
          await Api().sp.erase();
          await Future.delayed(Duration(seconds: 1), () {
            Get.offAll(const LoginScreen());
          });
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem(
            value: "editprofile",
            onTap: null,
            child: Text("My Account"),
          ),
          PopupMenuItem(
            value: "subscription",
            onTap: null,
            child: const Text("Subscription"),
          ),
          PopupMenuItem(
            value: "secureApp",
            onTap: null,
            child: const Text("Secure my App"),
          ),
          PopupMenuItem(
            value: "login",
            onTap: null,
            child: const Text("Sign in/Sign up"),
          ),
          PopupMenuItem(
            value: "postAnAdd",
            onTap: null,
            child: const Text("Post an Add"),
          ),
          PopupMenuItem(
            value: "changePassword",
            onTap: null,
            child: const Text(
              "Change Password",
            ),
          ),
          PopupMenuItem(
            value: "chatWithUs",
            onTap: null,
            child: const Text("Chat with us"),
          ),
          PopupMenuItem(
            value: "logOut",
            onTap: null,
            child: const Text("Log Out"),
          )
        ];
      },
    );
  }
}
