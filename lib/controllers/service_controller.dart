import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:intl/intl.dart';
import 'package:services_app/models/user_model.dart';
import 'package:services_app/network/Api.dart';
import 'package:location/location.dart';
import 'package:share_plus/share_plus.dart';
import '../models/postserviceModel.dart';
import '../models/postservicedetailModel.dart';

class ServiceController extends GetxController {
  bool isloading = true;
  bool isfetchingservice = false;
  bool postServiceloading = false;
  bool animationcompleted = false;
  User? activeUser;
  bool postServiceDetailloading = false;
  List<CarRentalService> carRentalServices = [];
  CarServiceGoogleDetailModel? cardetail;

  List<PostServiceModel>? postServiceModel;
  RxInt selectedIndex = 0.obs;
  PostServiceDetailModel? post;

  RxString locationText = ''.obs;

  Map<String, Locale> languages = {
    "Hindi": const Locale('hi', 'IN'),
    "Espanol": const Locale('en', 'US')
  };

  void getLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    // Check if location services are enabled
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    // Check if location permissions are granted
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // Get the current location
    _locationData = await location.getLocation();
    locationText(
        'Latitude: ${_locationData.latitude}, Longitude: ${_locationData.longitude}');
    Share.share(locationText.value);
  }

  // List<PostServiceDetailModel>? postServicedetailModel;
  Future<void> fetchServices(String type, {double radius = 1000}) async {
    isloading = true;
    String url =
        "/place/nearbysearch/json?location=${position!.latitude},${position!.longitude}&radius=$radius&types=$type&key=$apiKey";
    var response = await Api().get(mapUrl + url);
    print(mapUrl + url);
    // print("This is response");
    // print(mapUrl + url);
    // print(response);
    List<dynamic> results = json.decode(response.body)['results'];

    carRentalServices = results.map((result) {
      final id = result['place_id'] ?? 'hello';
      final name = result['name'] ?? 'hello';
      final vicinity = result['vicinity'] ?? 'hello';
      final rating = result['rating']?.toDouble() ?? 0.0;
      final photoReference = result['photos']?[0]['photo_reference'];
      return CarRentalService(id, name, vicinity, rating, photoReference);
    }).toList();
    isloading = false;
    update();
    // mapPlacesFromJson(response);
  }

  // Google Detail

  Future<void> fetchServicesDetail(String id) async {
    isloading = true;
    String url = "/place/details/json?place_id=$id&key=$apiKey";
    var response = await Api().get(mapUrl + url);
    print(mapUrl + url);
    // Fetching Hours Openning
    List<dynamic> results = json.decode(response.body)['result']
        ['current_opening_hours']['weekday_text'];
    List<String> weekdays = [];
    for (var i = 0; i < results.length; i++) {
      weekdays.add(results[i]);
    }
    // ******************
    // Phone and Address
    String address = json.decode(response.body)['result']['formatted_address'];
    String phoneNum =
        json.decode(response.body)['result']['formatted_phone_number'];
    String website = json.decode(response.body)['result']['website'];

    // Reviews
    List<dynamic> reviews = json.decode(response.body)['result']['reviews'];
    List<Review> tempReviews = [];
    for (var i = 0; i < reviews.length; i++) {
      tempReviews.add(Review(
          authorName: reviews[i]['author_name'],
          description: reviews[i]['text']));
    }

    cardetail = CarServiceGoogleDetailModel(
        phoneNum,
        address,
        website,
        weekdays,
        LatLng(
            json.decode(response.body)['result']['geometry']['location']['lat'],
            json.decode(response.body)['result']['geometry']['location']
                ['lng']),
        tempReviews);
    isloading = false;
    update();
  }

  Future<void> fetchPostDetailService(String id) async {
    postServiceDetailloading = true;
    update();
    String url = "https://carservicesltd.com/wp-json/geodir/v2/places/$id";
    var response = await Api().get(url);
    postServiceDetailloading = false;
    print(url);
    print(response.body);
    final parsed = jsonDecode(response.body);
    post = PostServiceDetailModel.fromJson(parsed);
    update();
  }

  fetchPostService(String id) async {
    postServiceloading = true;
    update();
    String url =
        "https://carservicesltd.com/index.php/wp-json/geodir/v2/places?gd_placecategory=$id";
    print(url);
    var response = await Api().get(url);
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    try {
      postServiceModel = parsed
          .map<PostServiceModel>((item) => PostServiceModel.fromJson(item))
          .toList();
      postServiceloading = false;
      update();
      print("All working fine");
    } catch (e) {
      print(e);
    }
  }

  // User Fetching

  Future<void> getUserDetails() async {
    String url = "https://carservicesltd.com/api/user/get_userinfo/?user_id=43";
    var response = await Api().get(url);
    activeUser = userFromJson(response);
    update();
  }

  // **************

  String formatLastUpdatedDate(String dateString) {
    DateTime originalDateTime = DateTime.parse(dateString);
    DateTime now = DateTime.now();

    // Calculate the difference between now and the original date
    Duration difference = now.difference(originalDateTime);

    // Calculate the number of days in the difference
    int daysDifference = difference.inDays;

    // Format the output string
    String formattedDate = DateFormat.yMMMMd().format(originalDateTime);
    String ago = daysDifference == 1 ? "day" : "days";

    return "Last Updated $daysDifference $ago ago";
  }

  String removeTags(String htmlString) {
    // Decode HTML entities
    String decodedString = HtmlUnescape().convert(htmlString);

    // Remove HTML tags using a regular expression
    return decodedString.replaceAll(RegExp(r'<[^>]*>'), '');
  }

  @override
  void onInit() {
    // fetchServices();
    super.onInit();
  }
}

class CarRentalService {
  final String? id;
  final String? name;
  final String? vicinity;
  final double? rating;
  final String? photoReference;

  CarRentalService(
      this.id, this.name, this.vicinity, this.rating, this.photoReference);
}

class CarServiceGoogleDetailModel {
  String phoneNumber = '';
  String address = '';
  String website = '';
  List<String> weekdays = [];
  LatLng coordinates = const LatLng(0.0, 0.0);
  List<Review> reviews = [];

  CarServiceGoogleDetailModel(this.phoneNumber, this.address, this.website,
      this.weekdays, this.coordinates, this.reviews);
}

class Review {
  String authorName = '';
  String description = '';
  Review({required this.authorName, required this.description});
}
