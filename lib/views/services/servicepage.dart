import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services_app/lat_long.dart';
import 'package:services_app/views/Detail/detailpage.dart';
import 'package:services_app/widgets/rating_bar.dart';
import '../../controllers/googlemap_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;

import '../../network/Api.dart';

class ServicePage extends StatefulWidget {
  String title,service;

  ServicePage({super.key, required this.title,required this.service});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  double currentValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: GetBuilder<MapController>(builder: (controller) {
        return controller.carRentalServices.isNotEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Slider(
                      min: 1,
                      max: 5000,
                      divisions: 5,
                      label: currentValue.toString(),
                      activeColor: Colors.green,
                      inactiveColor: Colors.green.shade200,
                      value: currentValue,
                      onChanged: (newval) {
                      currentValue = newval;
                      
                      controller.fetchServices(widget.service,radius: currentValue);
                     
                      }),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.carRentalServices.length,
                      itemBuilder: (context, index) {
                        final service = controller.carRentalServices[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 30.0, left: 20, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              service.photoReference != null
                                  ? Stack(children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          buildPhotoUrl(
                                              service.photoReference ?? ''),
                                          width: 140,
                                          height: 120,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const Positioned(
                                          top: 5,
                                          right: 5,
                                          child: CircleAvatar(
                                            radius: 15,
                                            backgroundColor: Colors.white,
                                            child: Icon(
                                              Icons.search,
                                              color: Colors.grey,
                                              size: 15,
                                            ),
                                          ))
                                    ])                                  
                                  : Container(
                                    height: 120,
                                    width: 140,
                                    decoration: BoxDecoration(
                                      
                                      borderRadius: BorderRadius.circular(8),
                                      // border:Border(
                                      //   left: BorderSide(width: 5,color: Colors.black)
                                      // )
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 2
                                      )
                                    ),
                                    child:const  Center(child: Text(
                                      'No Image',style: TextStyle(fontWeight: FontWeight.bold),)),
                                  ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: ()async{
                                        await Get.to( DetailPage(title: service.name.toString(), detail: service.vicinity.toString(), photoReference: service.photoReference.toString(), rating: service.rating ?? 0.0));
                                      },
                                      child: Text(
                                        service.name ?? '',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(service.vicinity ?? ''),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    //  Text('Rating: ${service.rating.toStringAsFixed(1)}'),
                                    RatingBar(rating: service.rating ?? 0.0)
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                        //
                      },
                    ),
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }
}

String buildPhotoUrl(String photoReference) {
  final maxWidth = 400;
  final maxHeight = 400;

  return 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=$maxWidth&maxheight=$maxHeight&photoreference=$photoReference&key=$apiKey';
}
