import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import '../controllers/service_controller.dart';

class AppDrawer extends StatelessWidget {
  GlobalKey<DrawerControllerState> key2;
  AppDrawer({required this.key2});
  @override
  Widget build(BuildContext context) {
    ServiceController mapController = Get.find();
    return Drawer(
      key: key2,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                'Car Services Ltd',
                style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w400)),
                textAlign: TextAlign.center,
              ),
            ),
            decoration: BoxDecoration(
              color: lightgreencolor,
            ),
          ),
          ListTile(
            title: Text(
              'Notifications',
              style: GoogleFonts.nunito(),
            ),
            onTap: () {
              // Handle notifications
            },
          ),
          // Use ExpansionTile for the nested list
          ExpansionTile(
            title: Text('Translation', style: GoogleFonts.nunito()),
            children: <Widget>[
              ListTile(
                title: Text('Hindi', style: GoogleFonts.nunito()),
                onTap: () {
                  Get.updateLocale(const Locale('hi', 'IN'));
                  // Handle language 1
                },
              ),
              ListTile(
                title: Text('English', style: GoogleFonts.nunito()),
                onTap: () {
                  // Handle language 2
                  Get.updateLocale(const Locale('en', 'EN'));
                },
              ),
              ListTile(
                title: Text('Spanish', style: GoogleFonts.nunito()),
                onTap: () {
                  // Handle language 2
                  Get.updateLocale(const Locale('es', 'ES'));
                },
              ),
              ListTile(
                title: Text('German', style: GoogleFonts.nunito()),
                onTap: () {
                  // Handle language 2
                  Get.updateLocale(const Locale('de', 'DE'));
                },
              ),
              ListTile(
                title: Text('Italian', style: GoogleFonts.nunito()),
                onTap: () {
                  // Handle language 2
                  Get.updateLocale(const Locale('fr', 'FR'));
                },
              ),
              ListTile(
                title: Text('Russian', style: GoogleFonts.nunito()),
                onTap: () {
                  // Handle language 2
                  Get.updateLocale(const Locale('ru', 'RU'));
                },
              ),
              ListTile(
                title: Text('Dutch', style: GoogleFonts.nunito()),
                onTap: () {
                  // Handle language 2
                  Get.updateLocale(const Locale('du', 'DU'));
                },
              ),
              ListTile(
                title: Text('Turkish', style: GoogleFonts.nunito()),
                onTap: () {
                  // Handle language 2
                  Get.updateLocale(const Locale('tr', 'TR'));
                },
              ),
              ListTile(
                title: Text('Polish', style: GoogleFonts.nunito()),
                onTap: () {
                  // Handle language 2
                  Get.updateLocale(const Locale('pl', 'PL'));
                },
              ),
              ListTile(
                title: Text('Romanian', style: GoogleFonts.nunito()),
                onTap: () {
                  // Handle language 2
                  Get.updateLocale(const Locale('ro', 'RO'));
                },
              ),
              ListTile(
                title: Text('Czech', style: GoogleFonts.nunito()),
                onTap: () {
                  // Handle language 2
                  Get.updateLocale(const Locale('cs', 'CZ'));
                },
              ),
              ListTile(
                title: Text('Icelandic', style: GoogleFonts.nunito()),
                onTap: () {
                  // Handle language 2
                  Get.updateLocale(const Locale('is', 'IS'));
                },
              ),
              ListTile(
                title: Text('Ukranian', style: GoogleFonts.nunito()),
                onTap: () {
                  // Handle language 2
                  Get.updateLocale(const Locale('uk', 'UA'));
                },
              ),
            ],
          ),
          ListTile(
            title: Text('Share location', style: GoogleFonts.nunito()),
            onTap: () {
              mapController.getLocation();
              // Handle sharing location
            },
          ),
          // ListTile(
          //   title: Text('Favourites', style: GoogleFonts.nunito()),
          //   onTap: () {
          //     // Handle favorites
          //   },
          // ),
        ],
      ),
    );
  }
}
