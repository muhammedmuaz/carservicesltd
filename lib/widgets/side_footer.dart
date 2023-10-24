import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:services_app/main.dart';

class SiteFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff1C244B), // Set the desired background color
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  width: Get.width * 0.8,
                  height: 50.0,
                  image: NetworkImage(
                    "https://carservicesltd.com/wp-content/uploads/2023/06/flc_design20230623163057-1.png",
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  buildFooterLink(
                      "About", "https://carservicesltd.com/index.php/about/"),
                  buildFooterLink("Contact",
                      "https://carservicesltd.com/index.php/contact-us/"),
                  buildFooterLink("Careers",
                      "https://carservicesltd.com/index.php/careers/"),
                  buildFooterLink("Affiliate",
                      "https://carservicesltd.com/index.php/affiliate/"),
                  buildFooterLink(
                      "Forum", "https://carservicesltd.com/index.php/forum-2/"),
                ],
              ),
            ),
            buildFooterLink(
                "Blog", "https://carservicesltd.com/index.php/blog/"),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "© 2022 All Rights Reserved",
                  style: GoogleFonts.nunito(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFooterLink(String text, String url) {
    return TextButton(
      onPressed: () {
        // Add your navigation logic here
        launchUrlfunc(Uri.parse(url));
      },
      child: Text(
        text.tr,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
