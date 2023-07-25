import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../colors/colors.dart';

class CarDetailPage extends StatefulWidget {
  // final Car car;

  // CarDetailPage({required this.car});

  @override
  _CarDetailPageState createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.6, curve: Curves.easeInOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.8, curve: Curves.elasticOut),
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("Test"),
        // ),
        body: AnimatedBuilder(
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
                          height: MediaQuery.of(context).size.height * 0.55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1605559424843-9e4c228bf1c2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8Y2Fyc3xlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80"),
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
                                  Colors.black.withOpacity(0.3),
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text("Uttarpradesh India",
                                                    style: GoogleFonts.nunito(
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                const SizedBox(
                                                  height: 5.0,
                                                ),
                                                Text("Mercedez Benz",
                                                    style: GoogleFonts.nunito(
                                                        color: Colors.white,
                                                        fontSize: 24.0,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                              ],
                                            ),
                                            Container(
                                              height: 50,
                                              width: 50,
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle),
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  EvaIcons.heart,
                                                  color: Colors.red,
                                                  size: 30,
                                                ),
                                              ),
                                            ),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Profile",
                                    style: GoogleFonts.nunito(
                                        fontSize: 21,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                  ),
                                  Text(
                                    "Photos",
                                    style: GoogleFonts.nunito(
                                        fontSize: 21,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                  ),
                                  Text(
                                    "Map",
                                    style: GoogleFonts.nunito(
                                        fontSize: 21,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                  ),
                                  Text(
                                    "Reviews",
                                    style: GoogleFonts.nunito(
                                        fontSize: 21,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Divider(
                            height: 1.0,
                            thickness: 1.0,
                            color: Colors.grey[300],
                          ),
                        ),
                        // GridView.builder(
                        //     gridDelegate: gridDelegate,
                        //     itemBuilder: itemBuilder),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: CachedNetworkImage(
                                          imageUrl:
                                              "https://images.unsplash.com/photo-1646029642262-022158ff5794?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                                          fit: BoxFit.fill,
                                          height: 126,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.42,
                                          errorWidget: (context, url, error) =>
                                              Container(
                                                height: double.infinity,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    color: DynamicColor
                                                        .accentColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    image: const DecorationImage(
                                                        image: AssetImage(
                                                            "assets/NoImgPlaceholder.png"),
                                                        fit: BoxFit.fill)),
                                              ),
                                          placeholder: (context, url) =>
                                              Shimmer.fromColors(
                                                  baseColor: DynamicColor
                                                      .accentColor
                                                      .withOpacity(0.4),
                                                  highlightColor: DynamicColor
                                                      .orangeColor
                                                      .withOpacity(0.3),
                                                  child: Container(
                                                    height: double.infinity,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.0)),
                                                  ))),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: CachedNetworkImage(
                                          imageUrl:
                                              "https://images.unsplash.com/photo-1646029642262-022158ff5794?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                                          fit: BoxFit.fill,
                                          height: 126,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.42,
                                          errorWidget: (context, url, error) =>
                                              Container(
                                                height: double.infinity,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    color: DynamicColor
                                                        .accentColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    image: const DecorationImage(
                                                        image: AssetImage(
                                                            "assets/NoImgPlaceholder.png"),
                                                        fit: BoxFit.fill)),
                                              ),
                                          placeholder: (context, url) =>
                                              Shimmer.fromColors(
                                                  baseColor: DynamicColor
                                                      .accentColor
                                                      .withOpacity(0.4),
                                                  highlightColor: DynamicColor
                                                      .orangeColor
                                                      .withOpacity(0.3),
                                                  child: Container(
                                                    height: double.infinity,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.0)),
                                                  ))),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: CachedNetworkImage(
                                          imageUrl:
                                              "https://images.unsplash.com/photo-1646029642262-022158ff5794?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                                          fit: BoxFit.fill,
                                          height: 126,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.42,
                                          errorWidget: (context, url, error) =>
                                              Container(
                                                height: double.infinity,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    color: DynamicColor
                                                        .accentColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    image: const DecorationImage(
                                                        image: AssetImage(
                                                            "assets/NoImgPlaceholder.png"),
                                                        fit: BoxFit.fill)),
                                              ),
                                          placeholder: (context, url) =>
                                              Shimmer.fromColors(
                                                  baseColor: DynamicColor
                                                      .accentColor
                                                      .withOpacity(0.4),
                                                  highlightColor: DynamicColor
                                                      .orangeColor
                                                      .withOpacity(0.3),
                                                  child: Container(
                                                    height: double.infinity,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.0)),
                                                  ))),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: CachedNetworkImage(
                                          imageUrl:
                                              "https://images.unsplash.com/photo-1646029642262-022158ff5794?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                                          fit: BoxFit.fill,
                                          height: 126,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.42,
                                          errorWidget: (context, url, error) =>
                                              Container(
                                                height: double.infinity,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    color: DynamicColor
                                                        .accentColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    image: const DecorationImage(
                                                        image: AssetImage(
                                                            "assets/NoImgPlaceholder.png"),
                                                        fit: BoxFit.fill)),
                                              ),
                                          placeholder: (context, url) =>
                                              Shimmer.fromColors(
                                                  baseColor: DynamicColor
                                                      .accentColor
                                                      .withOpacity(0.4),
                                                  highlightColor: DynamicColor
                                                      .orangeColor
                                                      .withOpacity(0.3),
                                                  child: Container(
                                                    height: double.infinity,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.0)),
                                                  ))),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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
                        // ProfileSection(
                        //     "Price₹ 7.55 Lakh Manufacturing YearJun 2018 Registration YearJun 2018 Kilometer63,843 km Fuel TypePetrol TransmissionManual No. of Owner(s)First InsuranceComprehensive , till 23 Jun 2023 Registered atMumbai Registration typeIndividual ColorSilver Car Available at Mahim, Mumbai",
                        //     "Last Updated21 day(s) ago"),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
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
