import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:services_app/views/services/servicepage.dart';
import 'package:services_app/widgets/rating_bar.dart';
import 'package:shimmer/shimmer.dart';

import '../../colors/colors.dart';
import '../../controllers/service_controller.dart';

class DetailPage extends StatefulWidget {
  final String title, detail, photoReference;
  final double rating;

  const DetailPage(
      {super.key,
      required this.title,
      required this.detail,
      required this.photoReference,
      required this.rating});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;
  final random = Random();
  LatLng randomLatLng = LatLng(
      Random().nextDouble() * 180 - 90, Random().nextDouble() * 360 - 180);

  List<Map<String, String>> reviews = [
    {
      'name': 'John Doe',
      'review': 'Great experience with the product! Highly recommended.',
    },
    {
      'name': 'Jane Smith',
      'review':
          'Not satisfied with the service. Product quality needs improvement.',
    },
  ];
  ServiceController serviceController = Get.put(ServiceController());
  @override
  void dispose() {
    serviceController.animationcompleted = false;
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   title:  Text(detail.toString()),
        //   backgroundColor: Colors.green,
        //   automaticallyImplyLeading: false,
        // ),
        body: GetBuilder<ServiceController>(builder: (controller) {
          if (controller.animationcompleted == false) {
            _animationController = AnimationController(
              vsync: this,
              duration: const Duration(milliseconds: 500),
            );

            _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: _animationController,
                curve: const Interval(0.0, 0.6, curve: Curves.easeInOut),
              ),
            );

            _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
              CurvedAnimation(
                parent: _animationController,
                curve: const Interval(0.0, 0.8, curve: Curves.elasticOut),
              ),
            );

            _animationController.forward();
            controller.animationcompleted = true;
          }

          return AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Opacity(
                  opacity: _opacityAnimation.value,
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.55,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    image: NetworkImage(buildPhotoUrl(
                                        widget.photoReference.toString())),
                                    fit: BoxFit.cover),
                              ),
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  // color: Colors.transparent,
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.5),
                                      Colors.transparent
                                    ],
                                  ),
                                ),
                                child: Stack(children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle),
                                        child: IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(
                                            Icons.arrow_back,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 22.0, horizontal: 16.0),
                                        child: SizedBox(
                                            width: double.infinity,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    // FittedBox(
                                                    //   fit: BoxFit.contain,
                                                    //   child: SizedBox(
                                                    //     width: MediaQuery.of(
                                                    //                 context)
                                                    //             .size
                                                    //             .width *
                                                    //         0.7,
                                                    //     child: Text(
                                                    //         'ddodwkdwdw',
                                                    //         style: GoogleFonts.nunito(
                                                    //             color: Colors
                                                    //                 .white,
                                                    //             fontSize: 14.0,
                                                    //             fontWeight:
                                                    //                 FontWeight
                                                    //                     .w400)),
                                                    //   ),
                                                    // ),
                                                    // const SizedBox(
                                                    //   height: 5.0,
                                                    // ),
                                                    FittedBox(
                                                      fit: BoxFit.contain,
                                                      child: SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.7,
                                                        child: Text(
                                                            widget.title
                                                                .toString(),
                                                            style: GoogleFonts.nunito(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 24.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                // Container(
                                                //   height: 50,
                                                //   width: 50,
                                                //   alignment: Alignment.center,
                                                //   decoration:
                                                //       const BoxDecoration(
                                                //           color: Colors.white,
                                                //           shape:
                                                //               BoxShape.circle),
                                                //   child: IconButton(
                                                //     onPressed: () {},
                                                //     icon: const Icon(
                                                //       EvaIcons.heart,
                                                //       color: Colors.red,
                                                //       size: 30,
                                                //     ),
                                                //   ),
                                                // ),
                                              ],
                                            ))),
                                  ),
                                ]),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Obx(() {
                                    return Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () => serviceController
                                              .selectedIndex.value = 0,
                                          child: Text(
                                            "Profile",
                                            style: GoogleFonts.nunito(
                                                fontSize: 21,
                                                color: serviceController
                                                            .selectedIndex
                                                            .value ==
                                                        0
                                                    ? const Color(0xff264653)
                                                    : Colors.grey,
                                                fontWeight: serviceController
                                                            .selectedIndex
                                                            .value ==
                                                        0
                                                    ? FontWeight.w700
                                                    : FontWeight.w500),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                        ),
                                        GestureDetector(
                                          onTap: () => serviceController
                                              .selectedIndex.value = 1,
                                          child: Text(
                                            "Photos",
                                            style: GoogleFonts.nunito(
                                                fontSize: 21,
                                                color: serviceController
                                                            .selectedIndex
                                                            .value ==
                                                        1
                                                    ? const Color(0xff264653)
                                                    : Colors.grey,
                                                fontWeight: serviceController
                                                            .selectedIndex
                                                            .value ==
                                                        1
                                                    ? FontWeight.w700
                                                    : FontWeight.w500),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                        ),
                                        GestureDetector(
                                          onTap: () => serviceController
                                              .selectedIndex.value = 2,
                                          child: Text(
                                            "Map",
                                            style: GoogleFonts.nunito(
                                                fontSize: 21,
                                                color: serviceController
                                                            .selectedIndex
                                                            .value ==
                                                        2
                                                    ? const Color(0xff264653)
                                                    : Colors.grey,
                                                fontWeight: serviceController
                                                            .selectedIndex
                                                            .value ==
                                                        2
                                                    ? FontWeight.w700
                                                    : FontWeight.w500),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                        ),
                                        GestureDetector(
                                          onTap: () => serviceController
                                              .selectedIndex.value = 3,
                                          child: Text(
                                            "Reviews",
                                            style: GoogleFonts.nunito(
                                                fontSize: 21,
                                                color: serviceController
                                                            .selectedIndex
                                                            .value ==
                                                        3
                                                    ? const Color(0xff264653)
                                                    : Colors.grey,
                                                fontWeight: serviceController
                                                            .selectedIndex
                                                            .value ==
                                                        3
                                                    ? FontWeight.w700
                                                    : FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    );
                                  })),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Divider(
                                height: 1.0,
                                thickness: 1.0,
                                color: Colors.grey[300],
                              ),
                            ),
                            Obx(() {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Add the ListView.builder for displaying the reviews
                                  serviceController.selectedIndex.value == 3
                                      ? ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: reviews.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Card(
                                                elevation: 4,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        reviews[index]
                                                                ['name'] ??
                                                            '',
                                                        style:
                                                            GoogleFonts.nunito(
                                                          fontSize: 18,
                                                          color: const Color(
                                                              0xff264653),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Text(
                                                        reviews[index]
                                                                ['review'] ??
                                                            '',
                                                        style:
                                                            GoogleFonts.nunito(
                                                                fontSize: 16),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        )
                                      : const SizedBox(),
                                  serviceController.selectedIndex.value == 2
                                      ? locateMap(
                                          randomLatLng,
                                          MediaQuery.of(context).size.height *
                                              0.3)
                                      : const SizedBox(),
                                  serviceController.selectedIndex.value == 0
                                      ? ProfileSection(
                                          controller.removeTags(widget.detail))
                                      : const SizedBox(),
                                  serviceController.selectedIndex.value == 1
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12.0),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: List.generate(
                                                1,
                                                (index) => PhotosSection(
                                                    buildPhotoUrl(widget
                                                        .photoReference
                                                        .toString()),
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.42),
                                              )

                                              // PhotosSection(
                                              //     "https://images.unsplash.com/photo-1646029642262-022158ff5794?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                                              //     MediaQuery.of(context)
                                              //             .size
                                              //             .width *
                                              //         0.42),
                                              // PhotosSection(
                                              //     "https://images.unsplash.com/photo-1646029642262-022158ff5794?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                                              //     MediaQuery.of(context)
                                              //             .size
                                              //             .width *
                                              //         0.42),
                                              // ],
                                              ),
                                        )
                                      : const SizedBox(),
                                ],
                              );
                            })
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        }),
      ),
    );
  }

// Map Locate
  locateMap(latlong, height) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: latlong,
          zoom: 10.0,
        ),
        markers: Set<Marker>.from([
          Marker(
            markerId: MarkerId('random_point'),
            position: latlong,
            infoWindow: InfoWindow(title: 'Random Point'),
          ),
        ]),
      ),
    );
  }

  // Profile first Section
  ProfileSection(String? detail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            detail ?? "No Detail",
            style: GoogleFonts.nunito(color: Colors.black38),
          ),
        ),
      ],
    );
  }

  // Photos Section
  PhotosSection(String? imgurl, double width) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: CachedNetworkImage(
            imageUrl: imgurl!,
            fit: BoxFit.fill,
            height: 126,
            width: width,
            errorWidget: (context, url, error) => Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: DynamicColor.accentColor,
                      borderRadius: BorderRadius.circular(10.0),
                      image: const DecorationImage(
                          image: AssetImage("assets/NoImgPlaceholder.png"),
                          fit: BoxFit.fill)),
                ),
            placeholder: (context, url) => Shimmer.fromColors(
                baseColor: DynamicColor.accentColor.withOpacity(0.4),
                highlightColor: DynamicColor.orangeColor.withOpacity(0.3),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10.0)),
                ))));
  }
}
