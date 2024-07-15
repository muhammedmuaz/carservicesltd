import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:services_app/network/baseconfig.dart';
import 'package:http/http.dart' as http;

const String apiKey = 'AIzaSyC8N54f56EleJZDVenZFLGSmCcOLs3UHUA';
final String baseUrl = ProductionConfig().baseUrl;
final String apiUrl = ProductionConfig().apiUrl;
final String mapUrl = ProductionConfig().googlemapapiurl;
Position? position;

class Api {
  var sp = GetStorage();

  Future<dynamic> get(String url) async {
    try {
      final response = await http.get(
        Uri.parse(url),
      );
      return response;
    } on SocketException {
      BotToast.showText(text: 'No Internet Connection');
    }
    return null;
  }

  Future<dynamic> post(formdata, url,
      {fullurl, required RoundedLoadingButtonController postButton}) async {
    try {
      final response =
          await http.post(Uri.parse(fullurl ?? apiUrl + url), body: formdata);
      if (response.statusCode == 200) {
        return response.body;
      }
      print(response.body);
    } on SocketException {
      BotToast.showText(text: 'No Internet Connection');
    }
    return null;
  }

  Future<dynamic> postFormData(formData, fullUrl) async {
    try {
      // Encode username and password to Base64
      String basicAuth =
          'Basic ${base64Encode(utf8.encode('maaz:aSsl NIu4 Vt46 FYtY U1xV 9QgK'))}';
      // Your headers
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': basicAuth,
      };

      // Create a new http.Request object
      final response =
          await http.post(Uri.parse(fullUrl), body: formData, headers: headers);

      // Encode the request body to JSON
      // print("These are details");
      // print(response.statusCode);
      // // print(formData);
      // // print(headers);
      // print(response.statusCode);
      // print('Body??????????????????????');
      // print(response.body);
      // print('Body??????????????????????');
      // jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.statusCode;
      }
    } on SocketException {
      BotToast.showText(text: 'No Internet Connection');
      return null;
    }
  }

// Post Image
  Future<dynamic> postMultipart(
    String fullUrl,
    File imageFile,
  ) async {
    try {
      // Encode username and password to Base64
      String basicAuth =
          'Basic ${base64Encode(utf8.encode('maaz:aSsl NIu4 Vt46 FYtY U1xV 9QgK'))}';
      // Your headers
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': basicAuth,
      };
      var uri = Uri.parse(fullUrl);
      var request = http.MultipartRequest('POST', uri)..headers.addAll(headers);
      if (imageFile != null) {
        var stream = http.ByteStream(imageFile.openRead());
        stream.cast();
        var length = await imageFile.length();
        var multipartFile = http.MultipartFile('file', stream, length,
            filename: imageFile.path.split('/').last);
        request.files.add(multipartFile);
      }
      http.StreamedResponse response = await request.send();
      // var responseBytes = await response.stream.toBytes();
      // var responseString = utf8.decode(responseBytes);
      // print(responseString);
      // var response = await request.send();
      // print(response.stream);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseBytes = await response.stream.toBytes();
        var responseString = utf8.decode(responseBytes);
        return responseString;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } on SocketException {
      print('No Internet Connection');
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
