import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';
import 'package:services_app/constants.dart';
import 'package:services_app/controllers/service_controller.dart';

class CreateAnAdd extends StatefulWidget {
  const CreateAnAdd({super.key});

  @override
  State<CreateAnAdd> createState() => _CreateAnAddState();
}

class _CreateAnAddState extends State<CreateAnAdd> {
  @override
  List<String> availableTags = [
    'cars',
    'farm',
    'car for hire',
    'CentreTag',
    'garden',
    'wood',
    'Sample Tags',
    'Tags',
  ];
  List<String> selectedTags = [];
  String selectedid = '';
  String selectedcountry = '';
  final formKey = GlobalKey<FormState>();
  TextEditingController titleControler = TextEditingController();
  TextEditingController placedescription = TextEditingController();
  TextEditingController tagscontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController regioncontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController postcodecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController websitecontroller = TextEditingController();
  ServiceController controller = Get.put(ServiceController());

  final imgcontroller = MultiImagePickerController(
    maxImages: 15,
    allowedImageTypes: ['png', 'jpg', 'jpeg'],
    withData: true,
    withReadStream: true,
  );

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Add Place Heading
                  Text(
                    'Add Place',
                    style: GoogleFonts.nunito(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  // Enter Listing Details Heading
                  Text(
                    'Enter Listing Details',
                    style: GoogleFonts.nunito(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  // Place Title
                  TextFormField(
                    controller: titleControler,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Title';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: 'Title *'),
                  ),
                  const SizedBox(height: 16.0),

                  // Place Description
                  TextFormField(
                    controller: placedescription,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Description';
                      }
                      return null;
                    },
                    decoration:
                        const InputDecoration(labelText: 'Description *'),
                  ),
                  selectedTags.isNotEmpty
                      ? const SizedBox(height: 16.0)
                      : const SizedBox(),
                  const SizedBox(height: 16.0),
                  selectedTags.isNotEmpty
                      ? SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                selectedTags.length,
                                (index) => Container(
                                      // height: Get.height * 0.045,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      // width: Get.width * 0.22,
                                      decoration: BoxDecoration(
                                          color: lightgreencolor,
                                          borderRadius:
                                              BorderRadius.circular(16.0)),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: GestureDetector(
                                                onTap: () => setState(() =>
                                                    selectedTags
                                                        .removeAt(index)),
                                                child: const Icon(Icons.close)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 16.0),
                                            child: Center(
                                              child: Text(
                                                '#${selectedTags[index]}',
                                                style: GoogleFonts.nunito(
                                                    fontSize: 18.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                          ),
                        )
                      : const SizedBox(),
                  // const SizedBox(height: 16.0),

                  // Tags
                  TextFormField(
                    controller: tagscontroller,
                    decoration: const InputDecoration(labelText: 'Tags'),
                    onFieldSubmitted: (value) => setState(() {
                      selectedTags.add(value);
                      tagscontroller.clear();
                      for (var i = 0; i < selectedTags.length; i++) {
                        print(selectedTags[i]);
                      }
                    }),
                  ),
                  const SizedBox(height: 16.0),

// Category Side  required///////////////////////////////////

                  // Category
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Category *'),
                    items: const [
                      DropdownMenuItem(
                          value: '30', child: Text('Car & Truck Parts')),
                      // Add other category items here
                      DropdownMenuItem(
                          value: '10', child: Text('Car For Sale')),
                      DropdownMenuItem(
                          value: '11', child: Text('Car For Hire')),
                      DropdownMenuItem(value: '12', child: Text('Car Share')),
                      DropdownMenuItem(
                          value: '13',
                          child: Text('Chauffeur/Drivers For Hire')),
                      DropdownMenuItem(
                          value: '28', child: Text('Tow Services')),
                      DropdownMenuItem(
                          value: '29', child: Text('Car/Truck Mechanics')),
                      DropdownMenuItem(
                          value: '23', child: Text('Farm Equipment Hire')),
                      DropdownMenuItem(
                          value: '24', child: Text('Farm Equipment Sale')),
                      DropdownMenuItem(
                          value: 'Car Pooling', child: Text('Car Pooling')),
                      DropdownMenuItem(
                          value: '25', child: Text('Commercial Vehicles Hire')),
                      DropdownMenuItem(
                          value: '20', child: Text('Commercial Vehicle Sale')),
                      DropdownMenuItem(
                          value: '21', child: Text('Plant Equipment')),
                      DropdownMenuItem(
                          value: '22', child: Text('Uncategorized')),
                    ],
                    onChanged: (value) {
                      selectedid = value!;
                    },
                  ),

///////////////////////////////////////////////////////////////////
                  const SizedBox(height: 16.0),

                  // Address
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Address';
                      }
                      return null;
                    },
                    controller: addresscontroller,
                    decoration: const InputDecoration(labelText: 'Address *'),
                  ),
                  const SizedBox(height: 16.0),

                  // Country

                  DropdownButtonFormField<String>(
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Please enter Country';
                    //   }
                    //   return null;
                    // },
                    decoration: const InputDecoration(labelText: 'Country *'),
                    items: countries.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      selectedcountry = value!;
                    },
                  ),
                  const SizedBox(height: 16.0),

                  // Region
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Region';
                      }
                      return null;
                    },
                    controller: regioncontroller,
                    decoration: const InputDecoration(labelText: 'Region *'),
                  ),

                  const SizedBox(height: 16.0),

                  // City
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter City';
                      }
                      return null;
                    },
                    controller: citycontroller,
                    decoration: const InputDecoration(labelText: 'City *'),
                  ),
                  const SizedBox(height: 16.0),

                  // Postcode
                  TextFormField(
                    controller: postcodecontroller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Postcode'),
                  ),
                  const SizedBox(height: 16.0),

                  // Images
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: lightgreencolor,
                    ),
                    onPressed: () => imgcontroller.pickImages(),
                    child: const Text('Upload Images'),
                  ),
                  MultiImagePickerView(
                    controller: imgcontroller,
                    padding: const EdgeInsets.all(10),
                    onChange: (p0) => controller
                        .ispressedcpicon(!controller.ispressedcpicon.value),
                    initialContainerBuilder: (context, pickerCallback) {
                      return Container();
                    },
                  ),
                  const SizedBox(height: 16.0),

                  // Phone
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: phonecontroller,
                    decoration: const InputDecoration(labelText: 'Phone'),
                  ),
                  const SizedBox(height: 16.0),

                  // Email
                  TextFormField(
                    validator: (value) {
                      if (!value!.contains('@') || !value.contains('.')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    controller: emailcontroller,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  const SizedBox(height: 16.0),

                  // Website
                  TextFormField(
                    validator: (value) {
                      if (!value!.contains('.')) {
                        return 'Please enter a valid website url';
                      }
                      return null;
                    },
                    controller: websitecontroller,
                    decoration: const InputDecoration(labelText: 'Website'),
                  ),
                  const SizedBox(height: 16.0),

                  // Submit Button
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        controller.postaplace(
                            titleControler.text,
                            placedescription.text,
                            int.parse(selectedid),
                            selectedcountry,
                            addresscontroller.text,
                            regioncontroller.text,
                            citycontroller.text,
                            postcodecontroller.text,
                            phonecontroller.text,
                            emailcontroller.text,
                            websitecontroller.text,
                            File(imgcontroller.images.first.path!));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: lightgreencolor,
                    ),
                    child: const Text('Spread the love'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
