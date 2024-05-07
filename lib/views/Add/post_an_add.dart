import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:services_app/controllers/service_controller.dart';
import '../../controllers/post_an_add_Controller.dart';
import '../../utils/carservices_helper_functions.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Get.put(PostAnAddController());
    TextEditingController titleController = TextEditingController();
    TextEditingController descController = TextEditingController();
    TextEditingController tagsController = TextEditingController();
    TextEditingController categoryController = TextEditingController();
    TextEditingController countryController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController regionController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController postcodeController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController websiteController = TextEditingController();
    ServiceController serviceController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Place Title *',
                  hintText: 'Enter the title.',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter post title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: descController,
                decoration: const InputDecoration(
                  labelText: 'Place Description *',
                  hintText: 'Enter a description',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter post description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: tagsController,
                decoration: const InputDecoration(
                  labelText: 'Tags',
                  hintText: 'Enter tags (eg: tag1, tag2, tag3)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              _buildDropdownField(
                  'Category *',
                  [
                    'Car For Sale',
                    'Car For Hire',
                    'Car Share',
                    'Chauffeur/Drivers For Hire',
                    'Tow Services',
                    'Car/Truck Mechanics',
                    'Farm Equipment Hire',
                    'Commercial Vehicles Hire',
                    'Commercial Vehicle Sale',
                    'Plant Equipment',
                    'Other Services'
                        'Car & Truck Parts',
                    // Add other categories...
                  ],
                  categoryController),
              const SizedBox(height: 20),
              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: 'Address *',
                  hintText: 'Enter a location',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: countryController,
                decoration: const InputDecoration(
                  labelText: 'Country *',
                  hintText: 'Enter country',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter post country';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: regionController,
                decoration: const InputDecoration(
                  labelText: 'Region *',
                  hintText: 'Enter listing region',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter region';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: cityController,
                decoration: const InputDecoration(
                  labelText: 'City *',
                  hintText: 'Enter listing city',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter city';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: postcodeController,
                decoration: const InputDecoration(
                  labelText: 'Postcode',
                  hintText: 'Enter listing postcode',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              _buildImageUploadSection(),
              const SizedBox(height: 20),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  hintText: 'Enter phone number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter email address',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: websiteController,
                decoration: const InputDecoration(
                  labelText: 'Website',
                  hintText: 'Enter website URL',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.url,
              ),
              const SizedBox(height: 20),
              serviceController.isSubmittingForm
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          serviceController.uploadedImagesPath.clear();
                          await serviceController.PostAService(
                              titleController.text,
                              descController.text,
                              tagsController.text,
                              addressController.text,
                              regionController.text,
                              cityController.text,
                              phoneController.text,
                              emailController.text,
                              websiteController.text,
                              countryController.text,
                              postcodeController.text);
                        }
                      },
                      child: const Text('Submit'),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField(
      String label, List<String> items, TextEditingController controller) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) {
        // Handle dropdown value changes
        if (value == "Car For Sale") {
          controller.text = '10';
        } else if (value == "Car For Hire") {
          controller.text = '11';
        } else if (value == "Car Share") {
          controller.text = '12';
        } else if (value == "Chauffeur/Drivers For Hire") {
          controller.text = '13';
        } else if (value == "Tow Services") {
          controller.text = '28';
        } else if (value == "Car/Truck Mechanics") {
          controller.text = '29';
        } else if (value == "Car & Truck Parts") {
          controller.text = '30';
        } else if (value == "Farm Equipment Hire") {
          controller.text = '23';
        } else if (value == "Commercial Vehicles Hire") {
          controller.text = '25';
        } else if (value == "Commercial Vehicle Sale") {
          controller.text = '20';
        } else if (value == "Plant Equipment") {
          controller.text = '21';
        } else {
          controller.text = '22';
        }
      },
    );
  }

  Widget _buildImageUploadSection() {
    PostAnAddController controller = Get.find();
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Images',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: () async {
              showCupertinoModalPopup(
                  barrierDismissible: true,
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoActionSheet(
                      actions: <Widget>[
                        CupertinoActionSheetAction(
                          onPressed: () async {
                            Navigator.pop(context);

                            final image = await controller
                                .uploadImages(ImageSource.camera);
                          },
                          child: const Text(
                            'Take a Picture',
                          ),
                        ),
                        CupertinoActionSheetAction(
                          onPressed: () async {
                            Navigator.pop(context);

                            await controller.uploadImages(ImageSource.gallery);
                          },
                          child: const Text(
                            'Choose from Gallery',
                          ),
                        ),
                      ],
                      cancelButton: CupertinoActionSheetAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Cancel',
                        ),
                      ),
                    );
                  });
            },
            icon: const Icon(Icons.file_upload),
            label: const Text('Upload Images'),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: controller.images.map((imagePath) {
              return _buildImageCard(imagePath);
            }).toList(),
          ),
        ],
      );
    });
  }

  Widget _buildImageCard(String imagePath) {
    PostAnAddController controller = Get.find();

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Image.file(
            File(imagePath),
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () {
                controller.removeImage(controller.images.indexOf(imagePath));
              },
              child: const Icon(
                Icons.close,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
