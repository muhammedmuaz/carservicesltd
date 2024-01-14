import 'package:get/get.dart';
import 'package:services_app/views/Add/post_an_add.dart';
import 'package:services_app/views/home/homepage.dart';
import 'package:services_app/views/login/login_page.dart';
import 'package:services_app/views/profile/change_password_page.dart';
import 'package:services_app/views/profile/edit_profile_page.dart';
import 'package:services_app/views/services/postservicedetailpage.dart';
import 'package:services_app/views/subscription/subscription_page.dart';
import '../bindings/LoginBindings.dart';
import '../bindings/servicebindings.dart';
import '../network/Api.dart';
import '../views/services/postservicepage.dart';
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
    GetPage(
        name: _Paths.postservice,
        page: () => PostServicePage(),
        binding: ServiceBindings()),
    GetPage(
        name: _Paths.postservicedetail,
        page: () => PostServiceDetailPage(),
        binding: ServiceBindings()),
    GetPage(
      name: _Paths.subscriptionPage,
      page: () => const SubscriptionPage(),
    ),
    GetPage(
      name: _Paths.editProfilePage,
      page: () => const EditProfilePage(),
    ),
    GetPage(
      name: _Paths.changePasswordPage,
      page: () => const ChangePasswordPage(),
    ),
    GetPage(
      name: _Paths.addPostPage,
      page: () => const AddPostPage(),
    ),
  ];
}
