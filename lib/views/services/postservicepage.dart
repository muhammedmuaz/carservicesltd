import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:services_app/colors/colors.dart';
import 'package:shimmer/shimmer.dart';
import '../../controllers/service_controller.dart';

class PostServicePage extends StatelessWidget {
  PostServicePage({super.key});
  // Use Get.arguments to retrieve the arguments passed from the FirstPage
  final String title = Get.arguments as String;

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff264653),
            centerTitle: true,
            title: Text(
              title,
              style:
                  const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Get.toNamed('/addPostPage');
                },
                icon: const Icon(Icons.add_box_outlined),
                color: Colors.black,
              )
            ],
          ),
          body: GetBuilder<ServiceController>(builder: (controller) {
            return controller.postServiceloading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: TextField(
                            controller: _searchController,
                            decoration: const InputDecoration(
                              labelText: 'Search',
                              hintText: 'Search',
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                            ),
                            onChanged: (value) {
                              controller.filterPostService(value);
                            },
                          ),
                        ),
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Two cards per row
                              childAspectRatio:
                                  0.75, // Adjust the aspect ratio as needed
                              mainAxisSpacing: 10.0,
                            ),
                            itemCount:
                                controller.filteredpostServiceModel!.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  controller.fetchPostDetailService(controller
                                      .filteredpostServiceModel![index].id
                                      .toString());
                                  Get.toNamed("/postservicedetail");
                                },
                                child: CarSaleCard(
                                  imgurl: controller
                                      .filteredpostServiceModel![index].image,
                                  title: controller
                                              .filteredpostServiceModel![index]
                                              .title
                                              .length >
                                          15
                                      ? '${controller.filteredpostServiceModel![index].title.substring(0, 15)}...'
                                      : controller
                                          .filteredpostServiceModel![index]
                                          .title,
                                  content: controller
                                              .removeTags(controller
                                                  .filteredpostServiceModel![
                                                      index]
                                                  .content)
                                              .length >
                                          30
                                      ? '${controller.removeTags(controller.filteredpostServiceModel![index].content).substring(0, 30)}...'
                                      : controller.removeTags(controller
                                          .filteredpostServiceModel![index]
                                          .content),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
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
    return GestureDetector(
      child: Card(
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
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                // reffer
                child: CachedNetworkImage(
                  imageUrl: imgurl!,
                  fit: BoxFit.fill,
                  height: 126,
                  width: double.infinity,
                  errorWidget: (context, url, error) => Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: DynamicColor.accentColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12)),
                        image: const DecorationImage(
                            image: AssetImage("assets/NoImgPlaceholder.png"),
                            fit: BoxFit.fill)),
                  ),
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: DynamicColor.accentColor.withOpacity(0.4),
                    highlightColor: DynamicColor.orangeColor.withOpacity(0.3),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12))),
                    ),
                  ),
                ),
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
                padding:
                    const EdgeInsets.only(left: 12.0, right: 12.0, top: 2.0),
                child: Text(
                  content ?? "No Content",
                  style: GoogleFonts.nunito(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: DynamicColor.primaryColor),
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
      ),
    );
  }
}
