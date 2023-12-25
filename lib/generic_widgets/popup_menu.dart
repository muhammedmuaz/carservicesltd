import 'package:flutter/material.dart';

class CarServicesPopUpMenu extends StatelessWidget {
  const CarServicesPopUpMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      elevation: 5,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      icon: const Icon(Icons.menu, color: Colors.black),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            onTap: () {},
            child: const Text("My Account"),
          ),
          PopupMenuItem(
            onTap: () {
              // mapController.getLocation();
            },
            child: const Text("Messages"),
          ),
          PopupMenuItem(
            onTap: () {},
            child: const Text("Sign in/Sign up"),
          ),
          PopupMenuItem(
            onTap: () {},
            child: const Text("Post an Add"),
          ),
          // Add more menu items as needed
        ];
      },
    );
  }
}
