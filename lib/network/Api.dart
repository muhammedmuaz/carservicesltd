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

const String apiKey = 'AIzaSyBvAXeC5Mli1NSZgVkK1VHF35iSskYiMlE';
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
    try {
      final response =
          await http.post(Uri.parse(fullurl ?? apiUrl + url), body: formdata);
      print("These are details");
      print(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        return response.body;
      }
    } on SocketException {
      BotToast.showText(text: 'No Internet Connection');
    }
    return null;
  }
}
