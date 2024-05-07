import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:services_app/controllers/service_controller.dart';
import 'package:share_plus/share_plus.dart';
import '../../const/design_const.dart';

class CarServicesHomeDrawer extends StatelessWidget {
  const CarServicesHomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: DesignConstants.kLogoSecondaryColor,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'CarServicesLtd',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          // ListTile(
          //   title: const Text('Notifications'),
          //   onTap: () {},
          // ),
          ExpansionTile(
            title: const Text('Translation'),
            children: <Widget>[
              ListTile(
                title: const Text('Hindi'),
                onTap: () => Get.updateLocale(const Locale('hi', 'IN')),
              ),
              ListTile(
                title: const Text('Spanish'),
                onTap: () => Get.updateLocale(const Locale('es', 'ES')),
              ),
              ListTile(
                title: const Text('German'),
                onTap: () => Get.updateLocale(const Locale('de', 'DE')),
              ),
              ListTile(
                title: const Text('French'),
                onTap: () => Get.updateLocale(const Locale('fr', 'FR')),
              ),
              ListTile(
                title: const Text('English'),
                onTap: () => Get.updateLocale(const Locale('en', 'US')),
              ),
              ListTile(
                title: const Text('Mandarin Chinese'),
                onTap: () => Get.updateLocale(const Locale('zn', 'CN')),
              ),
              ListTile(
                title: const Text('Bengali'),
                onTap: () => Get.updateLocale(const Locale('br', 'BD')),
              ),
              ListTile(
                title: const Text('Portuguese'),
                onTap: () => Get.updateLocale(const Locale('pt', 'BR')),
              ),
              ListTile(
                title: const Text('Russian'),
                onTap: () => Get.updateLocale(const Locale('ru', 'RU')),
              ),
              ListTile(
                title: const Text('Urdu'),
                onTap: () => Get.updateLocale(const Locale('ur', 'PK')),
              ),
              ListTile(
                title: const Text('Indonesian'),
                onTap: () => Get.updateLocale(const Locale('id', 'ID')),
              ),
            ],
          ),
          ListTile(
            title: const Text('Share location'),
            onTap: () async {
              // Get the current location
              LocationData? currentLocation = await getLocation();

              if (currentLocation != null) {
                // Create a location-sharing link
                String locationLink = createLocationLink(
                  currentLocation.latitude!,
                  currentLocation.longitude!,
                );

                // Open the map app or browser with the location link
                Share.shareUri(Uri.parse(locationLink));
              } else {
                // Handle the case where location data is not available
                print('Location data not available');
              }
            },
          ),
          ListTile(
            title: const Text('Featured Posts'),
            onTap: () {
              ServiceController mapController = Get.find();
              mapController.fetchPostService(id: '11');
              Get.toNamed(
                '/postservice',
                arguments: "Featured Posts",
              );
            },
          ),
          ListTile(
            title: const Text('Promoted Post'),
            onTap: () {
              ServiceController mapController = Get.find();
              mapController.fetchPostService(id: '13');
              Get.toNamed(
                '/postservice',
                arguments: "Promoted Posts",
              );
            },
          ),
          ListTile(
            title: const Text('Favourites'),
            onTap: () {
              ServiceController mapController = Get.find();
              mapController.fetchPostService(id: '10');
              Get.toNamed(
                '/postservice',
                arguments: "Favourites",
              );
              // Share.shareUri(Uri.parse(
              //     'https://play.google.com/store/apps/details?id=com.mgnit.carserviceltd1'));
            },
          ),
          ListTile(
            title: const Text('Share app link'),
            onTap: () {
              Share.shareUri(Uri.parse(
                  'https://play.google.com/store/apps/details?id=com.mgnit.carserviceltd1'));
            },
          ),
        ],
      ),
    );
  }
}

Future<LocationData?> getLocation() async {
  Location location = Location();
  bool serviceEnabled = await location.serviceEnabled();

  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return null;
    }
  }

  LocationPermission permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();

    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      return null;
    }
  }

  return await location.getLocation();
}

String createLocationLink(double latitude, double longitude) {
  // Use any map provider's URL format for sharing location
  // For example, using Google Maps
  return 'https://www.google.com/maps/place/$latitude,$longitude';
}
