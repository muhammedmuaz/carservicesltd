import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services_app/views/Detail/detailpage.dart';
import 'package:services_app/widgets/rating_bar.dart';
import '../../controllers/googlemap_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;

import '../../network/Api.dart';

class ServicePage extends StatefulWidget {
  String title;

  ServicePage({super.key, required this.title});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {

double currentValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          widget.title,
          style:const  TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: GetBuilder<MapController>(builder: (controller) {
        return controller.carRentalServices.isNotEmpty
            ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
              Slider(
                min: 0,
                max: 100 ,
                divisions: 20,
                label: currentValue.toString(),
                activeColor: Colors.green,
                inactiveColor: Colors.green.shade200,
                value: currentValue, onChanged: (newval){
                setState(() {
                  currentValue = newval;
                });
              }),

              
                Expanded(
                  child: ListView.builder(
                      itemCount: controller.carRentalServices.length,
                      itemBuilder: (context, index) {
                        final service = controller.carRentalServices[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom :30.0,left: 20,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              service.photoReference != null
                                ? Stack(
                                  children: [ ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                        buildPhotoUrl(service.photoReference),
                                        width: 140,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      ),
                                  ),
                                  const Positioned(
                                    top: 5,
                                    right: 5,
                                     child:    CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.white,
                                      child:    Icon( Icons.search,color: Colors.grey,size: 15,),
                                     )
                                   )
                                  ]
                                )
                                : const Icon(Icons.photo),
                                const SizedBox(width: 15,),
                                Expanded(
                                  child: Column(
                                   
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(onTap:()async{
                                        await Get.to( DetailPage(title: service.name,detail:service.vicinity,photoReference: service.photoReference,rating: service.rating,));
                                      } ,child: Text(service.name,style:const  TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                                      const SizedBox(height: 10,),
                                       Text(service.vicinity),
                                       const SizedBox(height: 15,),
                                      //  Text('Rating: ${service.rating.toStringAsFixed(1)}'),
                                       RatingBar(rating: service.rating)
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