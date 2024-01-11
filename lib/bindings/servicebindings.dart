import 'package:get/get.dart';
import 'package:services_app/controllers/service_controller.dart';

class ServiceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceController>(() => ServiceController());
  }
}
