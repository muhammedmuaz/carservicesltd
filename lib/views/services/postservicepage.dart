import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/service_controller.dart';

class PostServicePage extends StatelessWidget {
  String title;
  PostServicePage({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            centerTitle: true,
            title: Text(
              title,
              style:
                  const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          ),
          body: GetBuilder<ServiceController>(builder: (controller) {
            return controller.postServiceloading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Two cards per row
                        childAspectRatio:
                            0.75, // Adjust the aspect ratio as needed
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: controller.postServiceModel!.length,
                      itemBuilder: (context, index) {
                        return CarSaleCard(
                          imgurl: controller.postServiceModel![index].image,
                          title:
                              '${controller.postServiceModel![index].title.substring(0, 15)}...',
                          content:
                              '${controller.postServiceModel![index].content.substring(0, 35)}...',
                        );
                      },
                    ));
          })),
    );
  }
}

class CarSaleCard extends StatelessWidget {
  // ServiceController serviceController = Get.find();
  String? imgurl;
  String? title;
  String? content;
  CarSaleCard({super.key, this.imgurl, this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Colors.white,
      child: Container(
        // height: 300,
        width: MediaQuery.of(context).size.width * 0.45,
        decoration: BoxDecoration(
            // color: Colors.amberAccent,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 126,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          imgurl ?? "https://picsum.photos/250?image=9"))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 4.0),
              child: Text(
                title ?? "No Title",
                style: GoogleFonts.nunito(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 2.0),
              child: Text(
                content ?? "No Content",
                style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff134E00)),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              color: Colors.grey[180],
              child: Column(
                children: [
                  Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                    height: 5,
                  ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.star_border, color: Colors.grey[400]),
                      Icon(Icons.star_border, color: Colors.grey[400]),
                      Icon(Icons.star_border, color: Colors.grey[400]),
                      Icon(Icons.star_border, color: Colors.grey[400]),
                      Icon(Icons.star_border, color: Colors.grey[400])
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
