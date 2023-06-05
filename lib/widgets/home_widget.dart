import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services_app/views/carwash/carwash_page.dart';

Widget homepageItems(
    final String label, final String imageName, Color bgcoloor) {
  return GestureDetector(
    onTap: () {
      Get.to(const CarWashPage());
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Container(
              height: 50,
              width: 50,
              decoration:
                  BoxDecoration(color: bgcoloor, shape: BoxShape.circle),
              child: Center(
                  child: Image(
                      height: 30, width: 30, image: NetworkImage(imageName))),
            )),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
