import 'package:get/get.dart';
import 'package:services_app/views/createAdd/createanAdd.dart';
import 'package:services_app/views/home/homepage.dart';
import 'package:services_app/views/login/login_page.dart';
import 'package:services_app/views/services/postservicedetailpage.dart';
import '../bindings/LoginBindings.dart';
import '../bindings/servicebindings.dart';
import '../network/Api.dart';
import '../views/services/postservicepage.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();
  static var initial = Routes.createanAdd;
  // Api().sp.read('islogin') != null ? Routes.home : Routes.login;

  static final routes = [
    GetPage(
        name: _Paths.login,
        page: () => LoginScreen(),
        binding: LoginBindings()),
    GetPage(
        name: _Paths.home,
        page: () => const HomePage(),
        binding: LoginBindings()),
    GetPage(
        name: _Paths.postservice,
        page: () => PostServicePage(),
        binding: ServiceBindings()),
    GetPage(
        name: _Paths.postservicedetail,
        page: () => PostServiceDetailPage(),
        binding: ServiceBindings()),
    GetPage(
        name: _Paths.createanAdd,
        page: () => CreateAnAdd(),
        binding: ServiceBindings()),
  ];
}
