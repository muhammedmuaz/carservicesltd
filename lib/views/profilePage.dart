import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:services_app/Authentication/authenticate.dart';
import 'package:services_app/network/Api.dart';
import 'package:services_app/views/login/login_page.dart';
import 'package:services_app/views/webview/UserProfile.dart';
import 'package:services_app/views/webview/postandAdd.dart';
import 'package:services_app/widgets/home_widget.dart';
import '../../controllers/service_controller.dart';
import '../../widgets/drawer.dart';
import '../../widgets/side_footer.dart';
import '../constants.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String firstName = "Maaz";
  String lastName = "Zindani";
  String displayName = "maaz";
  String email = "maazzindani2003@gmail.com";
  String bio = "Flutter Developer";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff264653),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            Center(
              child: Container(
                height: Get.height * 0.1,
                width: Get.height * 0.1,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xff264653)),
                child: const Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
            ),
            const SizedBox(height: 20),
            buildTextField(Icons.person, 'First Name', firstName, (value) {
              setState(() {
                firstName = value;
              });
            }),
            const SizedBox(height: 5),
            buildTextField(Icons.person, 'Last Name', lastName, (value) {
              setState(() {
                lastName = value;
              });
            }),
            const SizedBox(height: 5),
            buildTextField(Icons.person, 'Display Name', displayName, (value) {
              setState(() {
                displayName = value;
              });
            }),
            const SizedBox(height: 5),
            buildTextField(Icons.email, 'Email', email, (value) {
              setState(() {
                email = value;
              });
            }),
            const SizedBox(height: 5),
            buildTextField(Icons.info, 'Bio', bio, (value) {
              setState(() {
                bio = value;
              });
            }),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff264653),
                ),
                child: const Text(
                  'Update Account',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff264653),
                ),
                child: const Text(
                  'Log out',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
      IconData icon, String label, String value, Function(String) onChanged) {
    return ListTile(
      leading: Icon(icon),
      title: TextFormField(
        initialValue: value,
        maxLines: label == 'Bio' ? 4 : 1,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
