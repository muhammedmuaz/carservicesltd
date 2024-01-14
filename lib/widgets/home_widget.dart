import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:services_app/views/services/servicepage.dart';
import '../controllers/service_controller.dart';

Widget homepageItems(final String label, final String imageName, Color bgcoloor,
    String service, int serviceType) {
  ServiceController mapController = Get.find();
  return GestureDetector(
    onTap: () {
      if (serviceType == 1) {
        if (mapController.postServiceModel != null) {
          mapController.postServiceModel!.clear();
        }
        mapController.fetchPostService(service);
        Get.toNamed(
          '/postservice',
          arguments: label,
        );
      } else {
        mapController.carRentalServices.clear();
        mapController.fetchServices(service);
        Get.to(ServicePage(
          title: label,
          service: service,
        ));
      }
    },
    child: serviceType == 1
        ? Container(
            alignment: Alignment.center,
            height: 30,
            width: double.infinity,
            child: Text(
              label.tr,
              style:
                  GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 16)),
              textAlign: TextAlign.center,
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: SizedBox(
              width: MediaQuery.of(Get.context!).size.width * 0.25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Image.network(
                        imageName,
                        height: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Center(
                      child: Text(
                    label.tr,
                    style: GoogleFonts.nunito(
                        textStyle: const TextStyle(fontSize: 12)),
                    textAlign: TextAlign.center,
                  ))
                ],
              ),
            ),
          ),
  );
}
