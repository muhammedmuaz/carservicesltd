import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services_app/views/Detail/detailpage.dart';
import 'package:services_app/widgets/rating_bar.dart';
import 'package:shimmer/shimmer.dart';
import '../../colors/colors.dart';
import '../../controllers/service_controller.dart';
import '../../network/Api.dart';

class ServicePage extends StatefulWidget {
  String title, service;

  ServicePage({super.key, required this.title, required this.service});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  double currentValue = 1000.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff264653),
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: GetBuilder<ServiceController>(builder: (controller) {
        return controller.isloading == false
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Slider(
                      min: 1000,
                      max: 5000,
                      divisions: 5,
                      label: currentValue.toString(),
                      activeColor: const Color(0xff264653),
                      inactiveColor: Colors.green.shade200,
                      value: currentValue,
                      onChanged: (newval) {
                        currentValue = newval;
                        controller.update();
                        Future.delayed(const Duration(seconds: 1), () {
                          controller.fetchServices(widget.service,
                              radius: currentValue);
                        });
                      }),
                  Expanded(
                    child: controller.carRentalServices.isEmpty
                        ? const Center(
                            child: Text('No Services Found'),
                          )
                        : ListView.builder(
                            itemCount: controller.carRentalServices.length,
                            itemBuilder: (context, index) {
                              final service =
                                  controller.carRentalServices[index];
                              return Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 30.0, left: 20, right: 10),
                                child: GestureDetector(
                                  onTap: () async {
                                    await Get.to(DetailPage(
                                        title: service.name.toString(),
                                        detail: service.vicinity.toString(),
                                        photoReference:
                                            service.photoReference.toString(),
                                        rating: service.rating ?? 0.0));
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      service.photoReference != null
                                          ? Stack(children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                // wrap in cached and add shimmer
                                                child: CachedNetworkImage(
                                                  imageUrl: buildPhotoUrl(
                                                      service.photoReference ??
                                                          ''),
                                                  width: 140,
                                                  height: 120,
                                                  fit: BoxFit.cover,
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Container(
                                                    height: double.infinity,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            DynamicColor
                                                                .accentColor,
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        12),
                                                                topRight: Radius
                                                                    .circular(
                                                                        12)),
                                                        image: const DecorationImage(
                                                            image: AssetImage(
                                                                "assets/NoImgPlaceholder.png"),
                                                            fit: BoxFit.fill)),
                                                  ),
                                                  placeholder: (context, url) =>
                                                      Shimmer.fromColors(
                                                    baseColor: DynamicColor.gray
                                                        .withOpacity(0.4),
                                                    highlightColor: DynamicColor
                                                        .whiteColor
                                                        .withOpacity(0.4),
                                                    child: Container(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      decoration: const BoxDecoration(
                                                          color: Colors.black,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          12),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          12))),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const Positioned(
                                                  top: 5,
                                                  right: 5,
                                                  child: CircleAvatar(
                                                    radius: 15,
                                                    backgroundColor:
                                                        Colors.white,
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
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: 2)),
                                              child: const Center(
                                                  child: Text(
                                                'No Image',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              service.name ?? '',
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(service.vicinity ?? ''),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            //  Text('Rating: ${service.rating.toStringAsFixed(1)}'),
                                            RatingBar(
                                                rating: service.rating ?? 0.0)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
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
