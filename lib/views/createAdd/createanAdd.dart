import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:services_app/constants.dart';

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
                    decoration:
                        const InputDecoration(labelText: 'Place Title *'),
                  ),
                  const SizedBox(height: 16.0),

                  // Place Description
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Place Description *'),
                  ),
                  const SizedBox(height: 16.0),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [],
                    ),
                  ),
                  SizedBox(height: 16.0),

                  // Tags
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Tags'),
                    onFieldSubmitted: (value) => setState(() {
                      selectedTags.add(value);
                    }),
                  ),
                  SizedBox(height: 16.0),

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
                          value: 'Car For Sale', child: Text('Car For Hire')),
                      DropdownMenuItem(
                          value: 'Car For Sale', child: Text('Car Share')),
                      DropdownMenuItem(
                          value: 'Car For Sale',
                          child: Text('Chauffeur/Drivers For Hire')),
                      DropdownMenuItem(
                          value: 'Car For Sale', child: Text('Tow Services')),
                      DropdownMenuItem(
                          value: 'Car For Sale',
                          child: Text('Car/Truck Mechanics')),
                      DropdownMenuItem(
                          value: 'Car For Sale',
                          child: Text('Farm Equipment Hire')),
                      DropdownMenuItem(
                          value: 'Car For Sale',
                          child: Text('Farm Equipment Sale')),
                      DropdownMenuItem(
                          value: 'Car For Sale', child: Text('Car Pooling')),
                      DropdownMenuItem(
                          value: 'Car For Sale',
                          child: Text('Commercial Vehicles Hire')),
                      DropdownMenuItem(
                          value: 'Car For Sale',
                          child: Text('Commercial Vehicle Sale')),
                      DropdownMenuItem(
                          value: 'Car For Sale',
                          child: Text('Plant Equipment')),
                      DropdownMenuItem(
                          value: 'Car For Sale', child: Text('Uncategorized')),
                    ],
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 16.0),

                  // Address
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Address *'),
                  ),
                  SizedBox(height: 16.0),

                  // Country
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Country *'),
                  ),
                  SizedBox(height: 16.0),

                  // Region
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Region *'),
                  ),
                  SizedBox(height: 16.0),

                  // City
                  TextFormField(
                    decoration: InputDecoration(labelText: 'City *'),
                  ),
                  SizedBox(height: 16.0),

                  // Postcode
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Postcode'),
                  ),
                  SizedBox(height: 16.0),

                  // Images
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: lightgreencolor,
                    ),
                    onPressed: () {},
                    child: Text('Upload Images'),
                  ),
                  SizedBox(height: 16.0),

                  // Phone
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Phone'),
                  ),
                  SizedBox(height: 16.0),

                  // Email
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  SizedBox(height: 16.0),

                  // Website
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Website'),
                  ),
                  SizedBox(height: 16.0),

                  // Submit Button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: lightgreencolor,
                    ),
                    child: Text('Spread the love'),
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
