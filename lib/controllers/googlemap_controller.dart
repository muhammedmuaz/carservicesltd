import 'package:get/get.dart';
import 'package:services_app/network/Api.dart';

class MapController extends GetxController {
  bool isloading = false;

  List<CarRentalService> carRentalServices = [];
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
