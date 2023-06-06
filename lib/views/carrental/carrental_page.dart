import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CarRentalPage extends StatefulWidget {
  const CarRentalPage({super.key});

  @override
  State<CarRentalPage> createState() => _CarRentalPageState();
}

class _CarRentalPageState extends State<CarRentalPage> {

  CameraPosition _initialLocation  =  CameraPosition(
  target:  LatLng(37.42796133580664, -122.085749655962)
  ,zoom: 14.4746
  ) ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'CAR RENTAL',
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: GoogleMap(initialCameraPosition: _initialLocation ),
    );
  }
}
