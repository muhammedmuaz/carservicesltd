import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarServicesPopUpMenu extends StatelessWidget {
  const CarServicesPopUpMenu({super.key});

  @override
  Widget build(BuildContext context) {
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
            onTap: () {
              // mapController.getLocation();
            },
            child: const Text("Messages"),
          ),
          PopupMenuItem(
            onTap: () => Get.toNamed('/changePasswordPage'),
            child: const Text("Change Password"),
          ),
          PopupMenuItem(
            onTap: () => Get.toNamed('/subscriptionPage'),
            child: const Text("Subscription"),
          ),
          PopupMenuItem(
            onTap: () {},
            child: const Text("Sign in/Sign up"),
          ),
          PopupMenuItem(
            onTap: () => Get.toNamed('/addPostPage'),
            child: const Text("Post an Add"),
          ),
        ];
      },
    );
  }
}
