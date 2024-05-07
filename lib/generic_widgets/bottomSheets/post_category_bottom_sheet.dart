import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/service_controller.dart';
import 'carservices_bottom_sheet.dart';

class PostCategoryBottomSheet extends StatefulWidget {
  final String searchTxt;
  const PostCategoryBottomSheet({required this.searchTxt, Key? key})
      : super(key: key);

  @override
  State<PostCategoryBottomSheet> createState() =>
      _PostCategoryBottomSheetState();
}

class _PostCategoryBottomSheetState extends State<PostCategoryBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return CarServicesBottomModalSheet(
      title: 'Select Category',
      content: GetBuilder<ServiceController>(builder: (controller) {
        return Column(
            children: List.generate(
                postCategories.length,
                (index) => ListTile(
                      dense: true,
                      onTap: () {
                        // serciceController.deselectPostCategory();
                        if (controller.selectedPostCategoryIndex == index) {
                          Get.back();
                          controller
                              .deselectPostCategoryBotomBar(widget.searchTxt);
                        } else {
                          Get.back();
                          controller.selectPostCategory(
                              index, widget.searchTxt);
                        }
                      },
                      trailing: Container(
                        width: 18,
                        alignment: Alignment.center,
                        height: 18,
                        padding: const EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.red,
                            width: 1.0,
                          ),
                        ),
                        child: controller.selectedPostCategoryIndex == index
                            ? Container(
                                margin: const EdgeInsets.all(1.0),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                              )
                            : null,
                      ),
                      contentPadding: const EdgeInsets.all(0),
                      title: Text(
                        postCategories[index].heading,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ))
            // provider.jobModeFilters.map((category) {
            //   bool isSelected = provider.activejobmodefilters == category.id;
            //   return SearchBottomSheetListTile(
            //     onTap: () async {
            //       if (provider.activejobmodefilters == category.id) {
            //         provider.updatejobmodefilter(0);
            //         AppNavigation.goBack();
            //       } else {
            //         provider.updatejobmodefilter(category.id);
            //         AppNavigation.goBack();
            //       }
            //     },
            //     label: category.name,
            //     isSelected: isSelected,
            //   );
            // }).toList(),
            );
      }),
    );
  }
}

class PostCategoryModel {
  String heading;
  String id;
  PostCategoryModel({required this.heading, required this.id});
}

List<PostCategoryModel> postCategories = [
  PostCategoryModel(heading: 'Car For Sale', id: '10'),
  PostCategoryModel(heading: 'Car For Hire', id: '11'),
  PostCategoryModel(heading: 'Car Share', id: '12'),
  PostCategoryModel(heading: 'Chauffeur/Drivers For Hire', id: '13'),
  PostCategoryModel(heading: 'Tow Services', id: '28'),
  PostCategoryModel(heading: 'Car/Truck Mechanics', id: '29'),
  PostCategoryModel(heading: 'Car & Truck Parts', id: '30'),
  PostCategoryModel(heading: 'Farm Equipment Hire', id: '23'),
  PostCategoryModel(heading: 'Farm Equipment Sale', id: '24'),
  PostCategoryModel(heading: 'Commercial Vehicles Hire', id: '25'),
  PostCategoryModel(heading: 'Commercial Vehicle Sale', id: '20'),
  PostCategoryModel(heading: 'Plant Equipment', id: '21'),
  PostCategoryModel(heading: 'Other Services', id: '22'),
];
