import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services_app/controllers/service_controller.dart';
import '../../controllers/post_an_add_Controller.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PostAnAddController());
    ServiceController serviceController = Get.find();

    TextEditingController titleController = TextEditingController();
    TextEditingController descController = TextEditingController();
    TextEditingController tagsController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController regionController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController postcodeController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController websiteController = TextEditingController();

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
              _buildDropdownField('Category *', [
                'Car & Truck Parts',
                'Car For Hire',
                'Car For Sale',
                // Add other categories...
              ]),
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
              _buildDropdownField(
                  'Country *', ['United States', 'Other countries']),
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
              ElevatedButton(
                onPressed: () async {
                  await serviceController.PostAService();
                  // if (_formKey.currentState!.validate()) {
                  // Handle form submission
                  // Access form values and _images list for image paths
                  // }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField(String label, List<String> items) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) {
        // Handle dropdown value changes
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
          SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: () async {
              print("Hllo");
              await controller.uploadImages();
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
              child: Icon(
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
