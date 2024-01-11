import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:services_app/controllers/service_controller.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

import '../../colors/colors.dart';

class PostServiceDetailPage extends StatefulWidget {
  // final Car car;

  // CarDetailPage({required this.car});

  @override
  _PostServiceDetailPageState createState() => _PostServiceDetailPageState();
}

class _PostServiceDetailPageState extends State<PostServiceDetailPage>
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

  bool isshareactive = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("Test"),
        // ),
        body: GetBuilder<ServiceController>(builder: (controller) {
          if (!controller.postServiceDetailloading) {
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
          }
          return controller.postServiceDetailloading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : AnimatedBuilder(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.55,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                        image: NetworkImage(controller
                                            .post!.featuredImage['src']),
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
                                                vertical: 22.0,
                                                horizontal: 16.0),
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
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        FittedBox(
                                                          fit: BoxFit.contain,
                                                          child: SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.7,
                                                            child: Text(
                                                                '${controller.post!.city} ${controller.post!.country}',
                                                                style: GoogleFonts.nunito(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400)),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 5.0,
                                                        ),
                                                        FittedBox(
                                                          fit: BoxFit.contain,
                                                          child: SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.7,
                                                            child: Text(
                                                                controller.post!
                                                                    .title,
                                                                style: GoogleFonts.nunito(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        24.0,
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
                                                    //   alignment:
                                                    //       Alignment.center,
                                                    //   decoration:
                                                    //       const BoxDecoration(
                                                    //           color:
                                                    //               Colors.white,
                                                    //           shape: BoxShape
                                                    //               .circle),
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Obx(() {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                        ? const Color(
                                                            0xff264653)
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
                                                        ? const Color(
                                                            0xff264653)
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
                                                        ? const Color(
                                                            0xff264653)
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
                                                        ? const Color(
                                                            0xff264653)
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Add the ListView.builder for displaying the reviews
                                      serviceController.selectedIndex.value == 3
                                          ?

                                          // ListView.builder(
                                          //     shrinkWrap: true,
                                          //     physics:
                                          //         const NeverScrollableScrollPhysics(),
                                          //     itemCount: reviews.length,
                                          //     itemBuilder: (context, index) {
                                          //       return Padding(
                                          //         padding: const EdgeInsets
                                          //             .symmetric(vertical: 8.0),
                                          //         child: Card(
                                          //           elevation: 4,
                                          //           shape:
                                          //               RoundedRectangleBorder(
                                          //             borderRadius:
                                          //                 BorderRadius.circular(
                                          //                     10.0),
                                          //           ),
                                          //           child: Padding(
                                          //             padding:
                                          //                 const EdgeInsets.all(
                                          //                     16.0),
                                          //             child: Column(
                                          //               crossAxisAlignment:
                                          //                   CrossAxisAlignment
                                          //                       .start,
                                          //               children: [
                                          //                 Text(
                                          //                   reviews[index]
                                          //                           ['name'] ??
                                          //                       '',
                                          //                   style: GoogleFonts
                                          //                       .nunito(
                                          //                     fontSize: 18,
                                          //                     color: const Color(
                                          //                         0xff264653),
                                          //                     fontWeight:
                                          //                         FontWeight
                                          //                             .bold,
                                          //                   ),
                                          //                 ),
                                          //                 const SizedBox(
                                          //                     height: 5),
                                          //                 Text(
                                          //                   reviews[index][
                                          //                           'review'] ??
                                          //                       '',
                                          //                   style: GoogleFonts
                                          //                       .nunito(
                                          //                           fontSize:
                                          //                               16),
                                          //                 ),
                                          //               ],
                                          //             ),
                                          //           ),
                                          //         ),
                                          //       );
                                          //     },
                                          //   )

                                          const Center(
                                              child: Text('No Reviews Yet'),
                                            )
                                          : const SizedBox(),

                                      serviceController.selectedIndex.value == 2
                                          ? serviceController
                                                          .post!.latitude ==
                                                      0.00 ||
                                                  serviceController
                                                          .post!.longitude ==
                                                      0.00
                                              ? const Center(
                                                  child: Text(
                                                      'No Location Available'),
                                                )
                                              : locateMap(
                                                  LatLng(
                                                      serviceController
                                                          .post!.latitude,
                                                      serviceController
                                                          .post!.longitude),
                                                  MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3)
                                          : const SizedBox(),

                                      // Images section

                                      serviceController.selectedIndex.value == 1
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12.0),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: List.generate(
                                                    controller.post!.images
                                                                .length >
                                                            2
                                                        ? (controller
                                                                    .post!
                                                                    .images
                                                                    .length /
                                                                2)
                                                            .round()
                                                        : 1,
                                                    (index) => PhotosSection(
                                                        controller.post!
                                                                .images[index]
                                                            ['src'],
                                                        controller.post!.images
                                                                    .length !=
                                                                (index + 1)
                                                            ? controller.post!
                                                                    .images[
                                                                index]['src']
                                                            : null,
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

                                      serviceController.selectedIndex.value == 0
                                          ? ProfileSection(
                                              controller.removeTags(
                                                  controller.post!.content),
                                              controller.formatLastUpdatedDate(
                                                  controller.post!.date))
                                          : const SizedBox(),
                                    ],
                                  );
                                }),

                                // Padding(
                                //   padding: const EdgeInsets.all(12.0),
                                //   child: SizedBox(
                                //     height: MediaQuery.of(context).size.height * 0.3,
                                //     child: GridView.builder(
                                //       // physics: const BouncingScrollPhysics(),
                                //       gridDelegate:
                                //           const SliverGridDelegateWithFixedCrossAxisCount(
                                //         crossAxisCount: 2,
                                //         crossAxisSpacing: 12.0,
                                //         mainAxisSpacing: 12.0,
                                //       ),
                                //       itemCount: 6,
                                //       itemBuilder: (context, index) {
                                //         return ClipRRect(
                                //           borderRadius: BorderRadius.circular(10.0),
                                //           child: CachedNetworkImage(
                                //             imageUrl:
                                //                 "https://images.unsplash.com/photo-1646029642262-022158ff5794?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                                //             fit: BoxFit.cover,
                                //             height: 126,
                                //             width: MediaQuery.of(context).size.width *
                                //                 0.42,
                                //             errorWidget: (context, url, error) =>
                                //                 Container(
                                //               height: double.infinity,
                                //               width: double.infinity,
                                //               decoration: BoxDecoration(
                                //                 color: DynamicColor.accentColor,
                                //                 borderRadius:
                                //                     BorderRadius.circular(10.0),
                                //                 image: const DecorationImage(
                                //                   image: AssetImage(
                                //                       "assets/NoImgPlaceholder.png"),
                                //                   fit: BoxFit.fill,
                                //                 ),
                                //               ),
                                //             ),
                                //             placeholder: (context, url) =>
                                //                 Shimmer.fromColors(
                                //               baseColor: DynamicColor.accentColor
                                //                   .withOpacity(0.4),
                                //               highlightColor: DynamicColor.orangeColor
                                //                   .withOpacity(0.3),
                                //               child: Container(
                                //                 height: double.infinity,
                                //                 width: double.infinity,
                                //                 decoration: BoxDecoration(
                                //                   color: Colors.transparent,
                                //                   borderRadius:
                                //                       BorderRadius.circular(10.0),
                                //                 ),
                                //               ),
                                //             ),
                                //           ),
                                //         );
                                //       },
                                //     ),
                                //   ),
                                // )
                                // Padding(
                                //   padding: const EdgeInsets.all(12.0),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //     crossAxisAlignment: CrossAxisAlignment.start,
                                //     children: [
                                //       ClipRRect(
                                //         borderRadius: BorderRadius.circular(10.0),
                                //         child: CachedNetworkImage(
                                //             imageUrl:
                                //                 "https://images.unsplash.com/photo-1646029642262-022158ff5794?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                                //             fit: BoxFit.fill,
                                //             height: 126,
                                //             width: MediaQuery.of(context).size.width *
                                //                 0.42,
                                //             errorWidget: (context, url, error) =>
                                //                 Container(
                                //                   height: double.infinity,
                                //                   width: double.infinity,
                                //                   decoration: BoxDecoration(
                                //                       color: DynamicColor.accentColor,
                                //                       borderRadius:
                                //                           BorderRadius.circular(10.0),
                                //                       image: const DecorationImage(
                                //                           image: AssetImage(
                                //                               "assets/NoImgPlaceholder.png"),
                                //                           fit: BoxFit.fill)),
                                //                 ),
                                //             placeholder: (context, url) =>
                                //                 Shimmer.fromColors(
                                //                     baseColor: DynamicColor.accentColor
                                //                         .withOpacity(0.4),
                                //                     highlightColor: DynamicColor
                                //                         .orangeColor
                                //                         .withOpacity(0.3),
                                //                     child: Container(
                                //                       height: double.infinity,
                                //                       width: double.infinity,
                                //                       decoration: BoxDecoration(
                                //                           color: Colors.transparent,
                                //                           borderRadius:
                                //                               BorderRadius.circular(
                                //                                   10.0)),
                                //                     ))),
                                //       ),
                                //       ClipRRect(
                                //         borderRadius: BorderRadius.circular(10.0),
                                //         child: CachedNetworkImage(
                                //             imageUrl:
                                //                 "https://images.unsplash.com/photo-1646029642262-022158ff5794?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                                //             fit: BoxFit.fill,
                                //             height: 126,
                                //             width: MediaQuery.of(context).size.width *
                                //                 0.42,
                                //             errorWidget: (context, url, error) =>
                                //                 Container(
                                //                   height: double.infinity,
                                //                   width: double.infinity,
                                //                   decoration: BoxDecoration(
                                //                       color: DynamicColor.accentColor,
                                //                       borderRadius:
                                //                           BorderRadius.circular(10.0),
                                //                       image: const DecorationImage(
                                //                           image: AssetImage(
                                //                               "assets/NoImgPlaceholder.png"),
                                //                           fit: BoxFit.fill)),
                                //                 ),
                                //             placeholder: (context, url) =>
                                //                 Shimmer.fromColors(
                                //                     baseColor: DynamicColor.accentColor
                                //                         .withOpacity(0.4),
                                //                     highlightColor: DynamicColor
                                //                         .orangeColor
                                //                         .withOpacity(0.3),
                                //                     child: Container(
                                //                       height: double.infinity,
                                //                       width: double.infinity,
                                //                       decoration: BoxDecoration(
                                //                           color: Colors.transparent,
                                //                           borderRadius:
                                //                               BorderRadius.circular(
                                //                                   10.0)),
                                //                     ))),
                                //       ),
                                //     ],
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
        }),

        floatingActionButton: Stack(
          children: [
            // Positioned(
            //   bottom: 16.0,
            //   left: 16.0,
            //   child: FloatingActionButton.extended(
            //     backgroundColor: const Color(0xff264653),
            //     splashColor: const Color(0xff2a9d8f),
            //     onPressed: () {
            //       // Show the popup menu when the left button is pressed
            //       showPopupMenu(context);
            //     },
            //     icon: Icon(Icons.add),
            //     label: Text('Left Button'),
            //   ),
            // ),
            Positioned(
              bottom: 16.0,
              left: 16.0,
              child: FloatingActionButton(
                backgroundColor: const Color(0xff264653),
                splashColor: const Color(0xff2a9d8f),
                onPressed: () {
                  Share.share(
                      'check out Car Services LTD ${serviceController.post!.link}',
                      subject: 'Car Services LTD');
                },
                heroTag: 'shareButton',
                child: const Icon(Icons.share),
              ),
            ),
            // isshareactive
            //     ? Positioned(
            //         bottom: 80.0,
            //         left: 16.0,
            //         child: FloatingActionButton(
            //           heroTag: 'facebookButton',
            //           backgroundColor: const Color(0xff264653),
            //           splashColor: const Color(0xff2a9d8f),
            //           onPressed: () {},
            //           child: const Icon(EvaIcons.facebook),
            //         ),
            //       )
            //     : Container(),
            // isshareactive
            //     ? Positioned(
            //         bottom: 160.0,
            //         left: 16.0,
            //         child: FloatingActionButton(
            //           heroTag: 'linkedinButton',
            //           backgroundColor: const Color(0xff264653),
            //           splashColor: const Color(0xff2a9d8f),
            //           onPressed: () {},
            //           child: const Icon(EvaIcons.linkedin),
            //         ),
            //       )
            //     : Container(),
            // isshareactive
            //     ? Positioned(
            //         bottom: 240.0,
            //         left: 16.0,
            //         child: FloatingActionButton(
            //           heroTag: 'twitterButton',
            //           backgroundColor: const Color(0xff264653),
            //           splashColor: const Color(0xff2a9d8f),
            //           onPressed: () {},
            //           child: const Icon(EvaIcons.twitter),
            //         ),
            //       )
            //     : Container(),
            // isshareactive
            //     ? Positioned(
            //         bottom: 320.0,
            //         left: 16.0,
            //         child: FloatingActionButton(
            //           heroTag: 'tiktokButton',
            //           backgroundColor: const Color(0xff264653),
            //           splashColor: const Color(0xff2a9d8f),
            //           onPressed: () {},
            //           child: const Icon(Icons.tiktok),
            //         ),
            //       )
            //     : Container(),
            // isshareactive
            //     ? Positioned(
            //         bottom: 320.0,
            //         left: 16.0,
            //         child: FloatingActionButton(
            //           heroTag: 'worldwideButton',
            //           backgroundColor: const Color(0xff264653),
            //           splashColor: const Color(0xff2a9d8f),
            //           onPressed: () {},
            //           child: const ImageIcon(
            //               AssetImage("assets/logoworldwideadverts.png"),
            //               color: Colors.white),
            //         ),
            //       )
            //     : Container(),
            // Positioned(
            //   bottom: 16.0,
            //   right: 16.0,
            //   child: FloatingActionButton.extended(
            //     backgroundColor: const Color(0xff264653),
            //     splashColor: const Color(0xff2a9d8f),
            //     onPressed: () {
            //       // Add functionality for the right button here
            //       print('Right button pressed!');
            //     },
            //     icon: const Icon(Icons.add),
            //     label: const Text('Add Review'),
            //   ),
            // ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

// Profile first Section
ProfileSection(String? detail, String? date) {
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
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          date ?? "No Date",
          style: GoogleFonts.nunito(color: Colors.black38),
        ),
      ),
    ],
  );
}

// Photos Section
PhotosSection(String? imgurl, String? imgurl2, double width) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
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
                  ))),
        ),
        imgurl2 == null
            ? const SizedBox()
            : ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: CachedNetworkImage(
                    imageUrl: imgurl2!,
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
                                  image:
                                      AssetImage("assets/NoImgPlaceholder.png"),
                                  fit: BoxFit.fill)),
                        ),
                    placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: DynamicColor.accentColor.withOpacity(0.4),
                        highlightColor:
                            DynamicColor.orangeColor.withOpacity(0.3),
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10.0)),
                        ))),
              ),
      ],
    ),
  );
  ;
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
