import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:services_app/widgets/home_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
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
                        contentPadding: EdgeInsets.only(top: 0, left: 12),
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
                    width: MediaQuery.of(context).size.width * 0.15,
                    color: const Color(0xff30E3DF),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  homepageItems(
                      "CAR DEALER",
                      "https://cdn-icons-png.flaticon.com/128/2481/2481789.png",
                      const Color(0xff1B9C85)),
                  homepageItems(
                      "CAR RENTAL",
                      "https://cdn-icons-png.flaticon.com/128/2481/2481789.png",
                      const Color(0xffE4DCCF)),
                  homepageItems(
                      "CAR REAPIR",
                      "https://cdn-icons-png.flaticon.com/128/2481/2481789.png",
                      const Color(0xffE4DCCF)),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  homepageItems(
                      "CAR WASH",
                      "https://cdn-icons-png.flaticon.com/128/2481/2481789.png",
                      const Color(0xff1B9C85)),
                  homepageItems(
                      "TAXI STAND",
                      "https://cdn-icons-png.flaticon.com/128/2481/2481789.png",
                      const Color(0xffE4DCCF)),
                  homepageItems(
                      "GAS STATION",
                      "https://cdn-icons-png.flaticon.com/256/1658/1658010.png",
                      const Color(0xffE4DCCF))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
