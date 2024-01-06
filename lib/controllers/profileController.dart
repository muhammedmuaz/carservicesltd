// Define GetX controller for managing state
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var isPasswordHidden = true.obs;
  var isOldPasswordHidden = true.obs;
  var isConfirmPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleOldPasswordVisibility() {
    isOldPasswordHidden.value = !isOldPasswordHidden.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }
}
