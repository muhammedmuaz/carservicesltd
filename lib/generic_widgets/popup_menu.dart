import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services_app/network/Api.dart';
import 'package:services_app/utils/carservices_fingerprint.dart';

import '../views/login/forgot_Password.dart';

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
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            onTap: () => Get.toNamed('/editProfilePage'),
            child: const Text("My Account"),
          ),
          PopupMenuItem(
            onTap: () => Get.toNamed('/subscriptionPage'),
            child: const Text("Subscription"),
          ),
          PopupMenuItem(
            onTap: () {
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
            },
            child: const Text("Secure my App"),
          ),
          PopupMenuItem(
            onTap: () {
              Get.offAllNamed('/login');
            },
            child: const Text("Sign in/Sign up"),
          ),
          PopupMenuItem(
            onTap: () => Get.toNamed('/addPostPage'),
            child: const Text("Post an Add"),
          ),
          PopupMenuItem(
            onTap: () => Get.to(const ForgtPasswordScreen(
              isChangePass: true,
            )),
            child: const Text("Change Password"),
          ),
          PopupMenuItem(
            onTap: () {
              Api().sp.erase();
              Get.offAllNamed('/login');
            },
            child: const Text("Log Out"),
          )
        ];
      },
    );
  }
}
