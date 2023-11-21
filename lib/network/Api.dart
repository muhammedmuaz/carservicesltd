import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
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
      print("These are details");
      print(url);
      print(response.body);
      return response;
    } on SocketException {
      BotToast.showText(text: 'No Internet Connection');
    }
    return null;
  }

  Future<dynamic> post(formdata, url,
      {fullurl, required RoundedLoadingButtonController postButton}) async {
    String username = 'maaz';
    String password = 'aSsl NIu4 Vt46 FYtY U1xV 9QgK';
    // Set the Authorization header with Basic Authentication
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    try {
      final response = await http.post(
        Uri.parse(fullurl ?? apiUrl + url),
        body: formdata,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'Basic bWFhejphU3NsIE5JdTQgVnQ0NiBGWXRZIFUxeFbCoDlRZ0s='
        },
      );
      print("These are details");
      print(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        print(response.body);
        print(response.statusCode);
      }
    } on SocketException {
      BotToast.showText(text: 'No Internet Connection');
    } on HttpException catch (e) {
      print(e);
      print(e.message);
      print(e.uri);
    } catch (e) {
      print(e);
    }
    return null;
  }
}
