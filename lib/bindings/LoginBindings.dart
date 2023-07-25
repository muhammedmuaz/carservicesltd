import 'package:get/get.dart';
import 'package:services_app/controllers/login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<loginController>(() => loginController());
  }
}
