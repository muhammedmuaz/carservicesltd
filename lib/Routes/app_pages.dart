import 'package:get/get.dart';
import 'package:services_app/views/home/homepage.dart';
import 'package:services_app/views/login/login_page.dart';

import '../bindings/LoginBindings.dart';
import '../network/Api.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static var initial =
      Api().sp.read('islogin') != null ? Routes.home : Routes.login;

  static final routes = [
    GetPage(
        name: _Paths.login,
        page: () => LoginScreen(),
        binding: LoginBindings()),
    GetPage(
        name: _Paths.home,
        page: () => const HomePage(),
        binding: LoginBindings()),
  ];
}
