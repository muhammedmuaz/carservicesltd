import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services_app/const/design_const.dart';
import '../../controllers/profileController.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController _profileController = Get.put(ProfileController());

    final _formKey = GlobalKey<FormState>();
    final TextEditingController _oldPasswordController =
        TextEditingController();
    final TextEditingController _newPasswordController =
        TextEditingController();
    final TextEditingController _confirmPasswordController =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Change Password'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _oldPasswordController,
                  obscureText: _profileController.isOldPasswordHidden.value,
                  decoration: InputDecoration(
                    labelText: 'Old Password',
                    border: const OutlineInputBorder(),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _profileController.toggleOldPasswordVisibility();
                      },
                      child: Icon(
                        _profileController.isOldPasswordHidden.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your old password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _newPasswordController,
                  obscureText: _profileController.isPasswordHidden.value,
                  decoration: InputDecoration(
                    labelText: 'New Password',
                    border: const OutlineInputBorder(),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _profileController.togglePasswordVisibility();
                      },
                      child: Icon(
                        _profileController.isPasswordHidden.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a new password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: _profileController.isConfirmPasswordHidden.value,
                  validator: (value) {
                    if (value != _newPasswordController.text) {
                      return 'Passwords do not match';
                    } else if (value == null || value.isEmpty) {
                      return 'Please enter a confirm password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: const OutlineInputBorder(),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _profileController.toggleConfirmPasswordVisibility();
                      },
                      child: Icon(
                        _profileController.isConfirmPasswordHidden.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process your password change logic here
                      // Access entered passwords using _oldPasswordController.text, _newPasswordController.text, _confirmPasswordController.text
                    }
                  },
                  child: const Text(
                    'Change Password',
                    style:
                        TextStyle(color: DesignConstants.kLogoSecondaryColor),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
