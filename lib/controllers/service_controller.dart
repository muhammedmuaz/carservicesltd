import 'dart:convert';

import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:intl/intl.dart';
import 'package:services_app/network/Api.dart';
import '../models/postserviceModel.dart';
import '../models/postservicedetailModel.dart';

class ServiceController extends GetxController {
  bool isloading = true;
  bool postServiceloading = false;
  bool animationcompleted = false;
  bool postServiceDetailloading = false;
  List<CarRentalService> carRentalServices = [];
  List<PostServiceModel>? postServiceModel;
  RxInt selectedIndex = 0.obs;
  PostServiceDetailModel? post;

  // List<PostServiceDetailModel>? postServicedetailModel;
  fetchServices(String type, {double radius = 5000}) async {
    isloading = true;
    String url =
        "/place/nearbysearch/json?location=${position!.latitude},${position!.longitude}&radius=$radius&types=$type&key=$apiKey";
    var response = await Api().get(mapUrl + url);
    print("This is response");
    print(mapUrl + url);
    print(response);
    List<dynamic> results = json.decode(response.body)['results'];

    carRentalServices = results.map((result) {
      final name = result['name'] ?? 'hello';
      final vicinity = result['vicinity'] ?? 'hello';
      final rating = result['rating']?.toDouble() ?? 0.0;
      final photoReference = result['photos']?[0]['photo_reference'];
      return CarRentalService(name, vicinity, rating, photoReference);
    }).toList();
    isloading = false;
    update();
    // mapPlacesFromJson(response);
  }

  Future<void> fetchPostDetailService(String id) async {
    postServiceDetailloading = true;
    update();
    String url = "https://carservicesltd.com/wp-json/geodir/v2/places/$id";
    var response = await Api().get(url);
    postServiceDetailloading = false;
    final parsed = jsonDecode(response.body);
    post = PostServiceDetailModel.fromJson(parsed);
    update();
  }

  fetchPostService(String id) async {
    postServiceloading = true;
    update();
    String url =
        "https://carservicesltd.com/index.php/wp-json/geodir/v2/places?gd_placecategory=$id";
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
  final String? name;
  final String? vicinity;
  final double? rating;
  final String? photoReference;

  CarRentalService(this.name, this.vicinity, this.rating, this.photoReference);
}
