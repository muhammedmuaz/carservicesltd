import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:services_app/const/data_const.dart';
import 'package:services_app/const/design_const.dart';
import 'package:services_app/generic_widgets/screen_widgets/screen_padding.dart';
import 'package:services_app/utils/helper_widgets/global_text_widget.dart';
import 'package:services_app/widgets/home_widget.dart';
import '../../controllers/service_controller.dart';
import '../../generic_widgets/popup_menu.dart';
import '../../utils/helper_widgets/add_height.dart';
import 'widgets/post_services_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Get.put(ServiceController());
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                          Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                color: DesignConstants.kLogoSecondaryColor,
                                shape: BoxShape.circle),
                            child: const Center(
                                child: Image(
                                    height: 20,
                                    width: 20,
                                    image: AssetImage("assets/home-logo.png"))),
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
                          const CarServicesPopUpMenu(),
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
                  height: Get.height * 0.25,
                  padding: const EdgeInsets.symmetric(
                      horizontal: DataConstants.kScreenHorizontalPadding),
                  color: Color(0xff1C244B),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AddHeight(0.01),
                      ScreenPadding(child: Image.asset('assets/logo.png')),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CarServicesTextWidget(text: '', style: TextStyle())
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
