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

  final imgcontroller = MultiImagePickerController(
    maxImages: 15,
    allowedImageTypes: ['png', 'jpg', 'jpeg'],
    withData: true,
    withReadStream: true,
  );

  Widget build(BuildContext context) {
    ServiceController controller = Get.put(ServiceController());
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
                                      height: Get.height * 0.045,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      width: Get.width * 0.22,
                                      decoration: BoxDecoration(
                                          color: lightgreencolor,
                                          borderRadius:
                                              BorderRadius.circular(16.0)),
                                      child: Stack(
                                        children: [
                                          const Align(
                                            alignment: Alignment.topRight,
                                            child: Icon(Icons.close),
                                          ),
                                          Center(
                                            child: Text(
                                              '#${selectedTags[index]}',
                                              style: GoogleFonts.nunito(
                                                  fontSize: 18.0),
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
                          value: 'Car & Truck Parts',
                          child: Text('Car & Truck Parts')),
                      // Add other category items here
                      DropdownMenuItem(
                          value: 'Car For Sale', child: Text('Car For Sale')),
                      DropdownMenuItem(
                          value: 'Car For Hire', child: Text('Car For Hire')),
                      DropdownMenuItem(
                          value: 'Car Share', child: Text('Car Share')),
                      DropdownMenuItem(
                          value: 'Chauffeur/Drivers For Hire',
                          child: Text('Chauffeur/Drivers For Hire')),
                      DropdownMenuItem(
                          value: 'Tow Services', child: Text('Tow Services')),
                      DropdownMenuItem(
                          value: 'Car/Truck Mechanics',
                          child: Text('Car/Truck Mechanics')),
                      DropdownMenuItem(
                          value: 'Farm Equipment Hire',
                          child: Text('Farm Equipment Hire')),
                      DropdownMenuItem(
                          value: 'Farm Equipment Sale',
                          child: Text('Farm Equipment Sale')),
                      DropdownMenuItem(
                          value: 'Car Pooling', child: Text('Car Pooling')),
                      DropdownMenuItem(
                          value: 'Commercial Vehicles Hire',
                          child: Text('Commercial Vehicles Hire')),
                      DropdownMenuItem(
                          value: 'Commercial Vehicle Sale',
                          child: Text('Commercial Vehicle Sale')),
                      DropdownMenuItem(
                          value: 'Plant Equipment',
                          child: Text('Plant Equipment')),
                      DropdownMenuItem(
                          value: 'Uncategorized', child: Text('Uncategorized')),
                    ],
                    onChanged: (value) {},
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Country';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: 'Country *'),
                    items: countries.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {},
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
                    controller: phonecontroller,
                    decoration: const InputDecoration(labelText: 'Phone'),
                  ),
                  const SizedBox(height: 16.0),

                  // Email
                  TextFormField(
                    controller: emailcontroller,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  const SizedBox(height: 16.0),

                  // Website
                  TextFormField(
                    controller: websitecontroller,
                    decoration: const InputDecoration(labelText: 'Website'),
                  ),
                  const SizedBox(height: 16.0),

                  // Submit Button
                  ElevatedButton(
                    onPressed: () {
                      controller.postaplace('title', 'description', 1);
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
