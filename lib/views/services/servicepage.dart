import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/googlemap_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;

import '../../network/Api.dart';

class ServicePage extends StatelessWidget {
  String title;

  ServicePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    MapController mapController = Get.put(MapController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: GetBuilder<MapController>(builder: (controller) {
        return controller.carRentalServices.isNotEmpty
            ? ListView.builder(
                itemCount: controller.carRentalServices.length,
                itemBuilder: (context, index) {
                  final service = controller.carRentalServices[index];
                  return ListTile(
                    leading: service.photoReference != null
                        ? Image.network(
                            buildPhotoUrl(service.photoReference),
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                          )
                        : const Icon(Icons.photo),
                    title: Text(service.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(service.vicinity),
                        Text('Rating: ${service.rating.toStringAsFixed(1)}'),
                      ],
                    ),
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }

  String buildPhotoUrl(String photoReference) {
    final maxWidth = 400;
    final maxHeight = 400;

    return 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=$maxWidth&maxheight=$maxHeight&photoreference=$photoReference&key=$apiKey';
  }
}
