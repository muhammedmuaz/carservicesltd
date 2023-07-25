import 'dart:convert';

import 'package:get/get.dart';
import 'package:services_app/network/Api.dart';
import '../models/postserviceModel.dart';
import '../models/postservicedetailModel.dart';

class ServiceController extends GetxController {
  bool isloading = true;
  bool postServiceloading = false;
  List<CarRentalService> carRentalServices = [];
  List<PostServiceModel>? postServiceModel;
  // List<PostServiceDetailModel>? postServicedetailModel;
  fetchServices(String type, {double radius = 5000}) async {
    isloading = true;
    String url =
        "/place/nearbysearch/json?location=${position!.latitude},${position!.longitude}&radius=$radius&types=$type&key=$apiKey";
    var response = await Api().get(mapUrl + url);
    List<dynamic> results = response['results'];

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
    postServiceloading = true;
    update();
    String url =
        "https://carservicesltd.com/index.php/wp-json/geodir/v2/places?gd_placecategory=$id";
    var response = await Api().get(url);
    print(response.body);
    postServiceloading = true;
    // final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return jsonDecode(response.body).map<PostServiceDetailModel>(
        (item) => PostServiceDetailModel.fromJson(item));
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
