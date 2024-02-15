import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services_app/const/design_const.dart';

import '../../controllers/service_controller.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceController serviceController = Get.find();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/home-logo.png',
                      ),
                      fit: BoxFit.contain)),
            ),
            // const CircleAvatar(
            //   radius: 60,
            //   backgroundImage: AssetImage(
            //       'assets/home-logo.png',), // Replace with your image
            // ),
            // const SizedBox(height: 20),
            // TextFormField(
            //   decoration: const InputDecoration(
            //     labelText: 'First Name',
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            // const SizedBox(height: 20),
            // TextFormField(
            //   decoration: const InputDecoration(
            //     labelText: 'Last Name',
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            const SizedBox(height: 20),
            TextFormField(
              readOnly: true,
              controller: serviceController.displayNameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              readOnly: true,
              controller: serviceController.emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            // const SizedBox(height: 20),
            // TextFormField(
            //   maxLines: 4,
            //   decoration: const InputDecoration(
            //     labelText: 'Bio',
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            const SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     // Add your save profile logic here
            //     serviceController.getUserDetails();
            //   },
            //   child: const Text(
            //     'Save Changes',
            //     style: TextStyle(color: DesignConstants.kLogoSecondaryColor),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
