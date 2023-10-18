// https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=51.503186,-0.126446&radius=5000&types=carrental&key=AIzaSyBvAXeC5Mli1NSZgVkK1VHF35iSskYiMlE

abstract class BaseConfig {
  String get apiUrl;
  String get baseUrl;
  String get googlemapapiurl;
}

class ProductionConfig implements BaseConfig {
  @override
  String get apiUrl => "https://carservicesltd.com/";
  @override
  String get baseUrl => "https://carservicesltd.com/";
  @override
  String get googlemapapiurl => "https://maps.googleapis.com/maps/api";
}
