import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:services_app/Authentication/authenticate.dart';
import 'package:services_app/network/Api.dart';
import 'package:services_app/views/login/login_page.dart';
import 'package:services_app/views/webview/UserProfile.dart';
import 'package:services_app/views/webview/postandAdd.dart';
import 'package:services_app/widgets/home_widget.dart';
import '../../controllers/service_controller.dart';
import '../../widgets/drawer.dart';
import '../../widgets/side_footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> bottomitems = [
    'About',
    'Contact',
    'Careers',
    'Affiliate',
    'Forum',
    'Blog',
    'Terms Of Use',
    'Privacy Policy',
    'Disclaimer',
    'Cookie Policy',
    'Data Protection',
  ];

  ServiceController mapController = Get.put(ServiceController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // checkBiometric();
    mapController.authorizeuser();
    // saveFingerprint();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<DrawerControllerState> _drawerKey =
      GlobalKey<DrawerControllerState>();

  @override
  Widget build(BuildContext context) {
    List<ServiceModel> serviceModel = [
      ServiceModel(
          name: "Car For Sale",
          image: "https://cdn-icons-png.flaticon.com/128/2155/2155790.png",
          color: const Color(0xffE4DCCF),
          tag: "gas_station",
          type: 0),
      ServiceModel(
          name: "Car For Hire",
          image: "https://cdn-icons-png.flaticon.com/128/3393/3393345.png",
          color: const Color(0xffE4DCCF),
          tag: "gas_station",
          type: 0),
      ServiceModel(
          name: "Car Rental",
          image: "https://cdn-icons-png.flaticon.com/128/3393/3393345.png",
          color: const Color(0xffE4DCCF),
          tag: "car_rental",
          type: 0),
    ];
    final Uri _url = Uri.parse(
        'https://carservicesltd.com/index.php/add-listing/?listing_type=gd_place');
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: AppDrawer(
          key2: _drawerKey,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(Get.context!).size.height * 0.03,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            color: Color(0xff1B9C85), shape: BoxShape.circle),
                        child: const Center(
                            child: Image(
                                height: 20,
                                width: 20,
                                image: NetworkImage(
                                    "https://cdn-icons-png.flaticon.com/128/2481/2481789.png"))),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        height: 42,
                        width: MediaQuery.of(context).size.width * 0.68,
                        child: TextField(
                            decoration: InputDecoration(
                          hintText: "NEARBY CAR SOLUTIONS",
                          hintStyle: GoogleFonts.nunito(
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          filled: true,
                          contentPadding:
                              const EdgeInsets.only(top: 0, left: 12),
                          fillColor: const Color(0xffF2F2F2),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        )),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),

                    Container(
                      height: 40,
                      width: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Color(0xff1B9C85),
                      ),
                      child: PopupMenuButton(
                        elevation: 5,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        icon: Icon(Icons.menu, color: Colors.black),
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem(
                              onTap: () => Get.to(const UserProfile()),
                              child: const Text("My Account"),
                            ),
                            PopupMenuItem(
                              onTap: () {},
                              child: const Text("Contact"),
                            ),
                            PopupMenuItem(
                              onTap: () {},
                              child: const Text("About Us"),
                            ),
                            PopupMenuItem(
                              onTap: () {},
                              child: const Text("Featured Post"),
                            ),
                            PopupMenuItem(
                              onTap: () {},
                              child: const Text("Promoted Post"),
                            ),
                            PopupMenuItem(
                              onTap: () {},
                              child: const Text("Favourite Post"),
                            ),
                            PopupMenuItem(
                              onTap: () {},
                              child: const Text("Messages"),
                            ),
                            PopupMenuItem(
                              onTap: () async {
                                bool auth =
                                    await Authentication.authentication();
                                if (auth) {
                                  await Api().sp.write('secure', '1');
                                  BotToast.showText(text: 'Fingerprint Added');
                                }
                              },
                              child: const Text("Add a Fingerprint"),
                            ),
                            PopupMenuItem(
                              onTap: () {
                                Api().sp.erase();
                                Get.offAll(LoginScreen());
                              },
                              child: const Text("Sign in/sign up"),
                            ),
                            PopupMenuItem(
                              onTap: () => Get.to(const PostAnAdd()),
                              child: const Text("Post Service / Product"),
                            ),
                            // Add more menu items as needed
                          ];
                        },
                      ),
                    )
                    // Container(
                    //   height: 42,
                    //   width: MediaQuery.of(context).size.width * 0.15,
                    //   color: const Color(0xff264653),
                    //   alignment: Alignment.center,
                    //   child: const Icon(
                    //     Icons.menu,
                    //     color: Colors.white,
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(Get.context!).size.height * 0.03,
                ),

////////////////POST Services///////////////////////////////////////////////////////////////
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("Nearby Services".toUpperCase(),
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))),
                ),
                SizedBox(
                  height: MediaQuery.of(Get.context!).size.height * 0.03,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    homepageItems(
                        "Car For Sale",
                        "https://cdn-icons-png.flaticon.com/128/2155/2155790.png",
                        const Color(0xffE4DCCF),
                        "car_dealer",
                        0),
                    homepageItems(
                        "Car For Hire",
                        "https://cdn-icons-png.flaticon.com/512/4635/4635348.png",
                        const Color(0xffE4DCCF),
                        "car_dealer",
                        0),
                    homepageItems(
                        "Car Rental",
                        "https://cdn-icons-png.flaticon.com/128/3393/3393345.png",
                        const Color(0xffE4DCCF),
                        "car_rental",
                        0),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    homepageItems(
                        "Chauffeur/Drivers For Hire",
                        "https://cdn.iconscout.com/icon/free/png-256/free-driver-1785014-1518720.png",
                        const Color(0xffE4DCCF),
                        "subway_station",
                        0),
                    homepageItems(
                        "Taxi Stand",
                        "https://cdn-icons-png.flaticon.com/128/3448/3448677.png",
                        const Color(0xffE4DCCF),
                        "taxi_stand",
                        0),
                    homepageItems(
                        "Fuel Station",
                        "https://cdn-icons-png.flaticon.com/256/9666/9666239.png",
                        const Color(0xffE4DCCF),
                        "gas_station",
                        0),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    homepageItems(
                        "Car Wash",
                        "https://icons.iconarchive.com/icons/atyourservice/service-categories/512/Car-Washing-icon.png",
                        const Color(0xffE4DCCF),
                        "car_wash",
                        0),
                    homepageItems(
                        "Car Repair",
                        "https://cdn-icons-png.flaticon.com/512/5361/5361512.png",
                        const Color(0xffE4DCCF),
                        "car_repair",
                        0),
                    homepageItems(
                        "Car Park",
                        "https://cdn-icons-png.flaticon.com/512/2343/2343894.png",
                        const Color(0xffE4DCCF),
                        "parking",
                        0),
                  ],
                ),

                // homepageItems(
                //     "Parking Spaces",
                //     "https://cdn-icons-png.flaticon.com/512/1788/1788637.png",
                //     const Color(0xffE4DCCF),
                //     "rv_park",
                //     0),
                SizedBox(
                  height: MediaQuery.of(Get.context!).size.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("POST Services".toUpperCase(),
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))),
                ),
                SizedBox(
                  height: MediaQuery.of(Get.context!).size.height * 0.03,
                ),
                Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      homepageItems(
                          "Car For Sale",
                          "https://cdn-icons-png.flaticon.com/128/2155/2155790.png",
                          const Color(0xffE4DCCF),
                          "10",
                          1),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[600],
                        ),
                      ),
                      homepageItems(
                          "Car For Hire",
                          "https://cdn-icons-png.flaticon.com/128/3393/3393345.png",
                          const Color(0xffE4DCCF),
                          "11",
                          1),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[600],
                        ),
                      ),
                      homepageItems(
                          "Car Share",
                          "https://cdn-icons-png.flaticon.com/128/4804/4804618.png",
                          const Color(0xffE4DCCF),
                          "12",
                          1),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[600],
                        ),
                      ),
                      homepageItems(
                          "Chauffeur/Drivers For Hire",
                          "https://cdn.iconscout.com/icon/free/png-256/free-driver-1785014-1518720.png",
                          const Color(0xffE4DCCF),
                          "13",
                          1),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[600],
                        ),
                      ),
                      homepageItems(
                          "Tow Services",
                          "https://cdn.iconscout.com/icon/premium/png-256-thumb/tow-truck-2980778-2476468.png",
                          const Color(0xffE4DCCF),
                          "28",
                          1),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[600],
                        ),
                      ),
                      homepageItems(
                          "Car/Truck Mechanics",
                          "https://tannerautorepairs.com.au/wp-content/uploads/2017/10/repair-service.png",
                          const Color(0xffE4DCCF),
                          "29",
                          1),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[600],
                        ),
                      ),
                      homepageItems(
                          "Car & Truck Parts",
                          "https://images.squarespace-cdn.com/content/v1/5420d068e4b09194f76b2af6/1593624596842-MSRYY384NEPB0IDNGF7K/piston2.png",
                          const Color(0xffE4DCCF),
                          "30",
                          1),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[600],
                        ),
                      ),
                      homepageItems(
                          "Farm Equipment Hire",
                          "https://cdn.iconscout.com/icon/premium/png-256-thumb/tractor-1977875-1667690.png?f=webp",
                          const Color(0xffE4DCCF),
                          "23",
                          1),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[600],
                        ),
                      ),
                      homepageItems(
                          "Farm Equipment Sale",
                          "https://cdn.iconscout.com/icon/premium/png-256-thumb/tractor-1977875-1667690.png?f=webp",
                          const Color(0xffE4DCCF),
                          "24",
                          1),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[600],
                        ),
                      ),
                      homepageItems(
                          "Commercial Vehicles Hire",
                          "https://www.bohr.de/media/6f805113-7b1c-4494-ae14-14a046a31512/fuhrpark.png?mw=600",
                          const Color(0xffE4DCCF),
                          "25",
                          1),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[600],
                        ),
                      ),
                      homepageItems(
                          "Commercial Vehicle Sale",
                          "https://www.bohr.de/media/6f805113-7b1c-4494-ae14-14a046a31512/fuhrpark.png?mw=600",
                          const Color(0xffE4DCCF),
                          "20",
                          1),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[600],
                        ),
                      ),
                      homepageItems(
                          "Plant Equipment",
                          "https://cdn.iconscout.com/icon/premium/png-256-thumb/tractor-1977875-1667690.png?f=webp",
                          const Color(0xffE4DCCF),
                          "21",
                          1),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[600],
                        ),
                      ),
                      homepageItems(
                          "Other Services",
                          "https://d2gfc6j4v8hvtl.cloudfront.net/wp-content/uploads/2018/11/247helpdesk.png",
                          const Color(0xffE4DCCF),
                          "22",
                          1),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SiteFooter()
                // Card(
                //   elevation: 5,
                //   child: Column(children: [
                //     ListView(
                //       shrinkWrap: true,
                //       padding: const EdgeInsets.all(8.0),
                //       children: bottomitems.map((item) {
                //         return Column(
                //           children: [
                //             GestureDetector(
                //                 onTap: () {
                //                   launchUrlfunc(_url);
                //                 },
                //                 child: Container(
                //                   alignment: Alignment.center,
                //                   height: 30,
                //                   width: double.infinity,
                //                   child: Text(
                //                     item.tr,
                //                     style: GoogleFonts.nunito(
                //                         textStyle:
                //                             const TextStyle(fontSize: 16)),
                //                     textAlign: TextAlign.center,
                //                   ),
                //                 )),
                //             Padding(
                //               padding:
                //                   const EdgeInsets.symmetric(horizontal: 10.0),
                //               child: Divider(
                //                 thickness: 0.5,
                //                 color: Colors.grey[600],
                //               ),
                //             ),
                //           ],
                //         );
                //       }).toList(),
                //     )
                //   ]),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ServiceModel {
  final String name;
  final String image;
  final Color color;
  final String tag;
  final int type;

  ServiceModel(
      {required this.name,
      required this.image,
      required this.color,
      required this.tag,
      required this.type});
}
