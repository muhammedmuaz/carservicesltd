import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:services_app/const/data_const.dart';
import 'package:services_app/const/design_const.dart';
import 'package:services_app/generic_widgets/drawer/home_screen_drawer.dart';
import 'package:services_app/generic_widgets/screen_widgets/screen_padding.dart';
import 'package:services_app/widgets/home_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controllers/service_controller.dart';
import '../../generic_widgets/popup_menu.dart';
import '../../utils/helper_widgets/add_height.dart';
import 'widgets/post_services_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    Get.put(ServiceController());
    return SafeArea(
      child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          drawer: const CarServicesHomeDrawer(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ScreenPadding(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const AddHeight(0.03),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              scaffoldKey.currentState!.openDrawer();
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                  color: DesignConstants.kLogoSecondaryColor,
                                  shape: BoxShape.circle),
                              child: const Center(
                                  child: Image(
                                      height: 20,
                                      width: 20,
                                      image:
                                          AssetImage("assets/home-logo.png"))),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 42,
                              // width: MediaQuery.of(context).size.width * 0.68,
                              child: TextFormField(
                                  // keyboardType: TextInputType.none,
                                  onFieldSubmitted: ((value) {
                                    ServiceController mapController =
                                        Get.find();
                                    mapController.fetchPostService(
                                        isSearch: true, value: value);
                                    Get.toNamed(
                                      '/postserviceSearch',
                                      arguments: value,
                                    );
                                  }),
                                  decoration: InputDecoration(
                                    hintText: "NEARBY CAR SOLUTIONS",
                                    hintStyle: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
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
                              height: 42,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: DesignConstants.kLogoSecondaryColor,
                              ),
                              child: const CarServicesPopUpMenu()),
                        ],
                      ),
                      const AddHeight(0.03),
                      ////////////////Nearby Services///////////////////////////////////////////////////////////////
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("Nearby Services".toUpperCase(),
                            style: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                      ),
                      const AddHeight(0.03),
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
                      const AddHeight(0.03),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("POST Services".toUpperCase(),
                            style: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                      ),
                      const AddHeight(0.03),
                      const CarServicesPostServicesCard(),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: Get.height * 0.32,
                  padding: const EdgeInsets.symmetric(
                      horizontal: DataConstants.kScreenHorizontalPadding),
                  color: const Color(0xff1C244B),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const AddHeight(0.01),
                      ScreenPadding(child: Image.asset('assets/logo.png')),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                buildLink('About',
                                    'https://carservicesltd.com/index.php/about'),
                                buildLink('Affiliate',
                                    'https://carservicesltd.com/index.php/affiliate'),
                                buildLink('Terms Of Use',
                                    'https://carservicesltd.com/index.php/terms'),
                                buildLink('Cookie Policy',
                                    'https://carservicesltd.com/index.php/cookie'),
                                buildLink('FAQ',
                                    'https://carservicesltd.com/index.php/faq'),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                buildLink('Contact',
                                    'https://carservicesltd.com/index.php/contact-us/'),
                                buildLink('Forum',
                                    'https://carservicesltd.com/index.php/forum'),
                                buildLink('Privacy Policy',
                                    'https://carservicesltd.com/index.php/privacy'),
                                buildLink('Data Protection',
                                    'https://carservicesltd.com/index.php/data-protection'),
                                buildLink('Advertising Policy',
                                    'https://carservicesltd.com/index.php/advertising-policy'),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                buildLink('Careers',
                                    'https://carservicesltd.com/index.php/careers'),
                                buildLink('Blog',
                                    'https://carservicesltd.com/index.php/blog'),
                                buildLink('Disclaimer',
                                    'https://carservicesltd.com/index.php/disclaimer'),
                                buildLink('User Guide',
                                    'https://carservicesltd.com/index.php/user-guide'),
                                buildLink('', ''),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

GestureDetector buildLink(String title, String url) {
  return GestureDetector(
    onTap: () {
      // Open the URL when tapped
      launchUrl(Uri.parse(url));
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}
