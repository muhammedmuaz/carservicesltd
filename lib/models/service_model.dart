import 'package:flutter/material.dart';

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


// final List<String> bottomitems = [
//     'About',
//     'Contact',
//     'Careers',
//     'Affiliate',
//     'Forum',
//     'Blog',
//     'Terms Of Use',
//     'Privacy Policy',
//     'Disclaimer',
//     'Cookie Policy',
//     'Data Protection',
//   ];

// List<ServiceModel> serviceModel = [
    //   ServiceModel(
    //       name: "Car For Sale",
    //       image: "https://cdn-icons-png.flaticon.com/128/2155/2155790.png",
    //       color: const Color(0xffE4DCCF),
    //       tag: "gas_station",
    //       type: 0),
    //   ServiceModel(
    //       name: "Car For Hire",
    //       image: "https://cdn-icons-png.flaticon.com/128/3393/3393345.png",
    //       color: const Color(0xffE4DCCF),
    //       tag: "gas_station",
    //       type: 0),
    //   ServiceModel(
    //       name: "Car Rental",
    //       image: "https://cdn-icons-png.flaticon.com/128/3393/3393345.png",
    //       color: const Color(0xffE4DCCF),
    //       tag: "car_rental",
    //       type: 0),
    // ];



// final Uri _url = Uri.parse(
//         'https://carservicesltd.com/index.php/add-listing/?listing_type=gd_place');