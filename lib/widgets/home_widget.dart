import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services_app/views/services/servicepage.dart';

import '../controllers/googlemap_controller.dart';
import '../views/carrental/carrental_page.dart';

Widget homepageItems(final String label, final String imageName, Color bgcoloor,
    String service) {
  MapController mapController = Get.find();
  return GestureDetector(
    onTap: () {
      mapController.carRentalServices.clear();
      mapController.fetchServices(service);
      Get.to(ServicePage(
        title: label,
      ));
    },
    child:  Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
              width: 120,
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                 Center(
                   child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Image.network(
                      imageName,
                      height: 30,
                      ),
                   ),
                 ),
                 const SizedBox(height: 5.0,),
                 Center(child: Text(label,style: TextStyle(fontSize: 12.0),))
                  
                ],
               ),
             ),
    ),
         
  );
}
