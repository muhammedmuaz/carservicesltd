import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget myAppContiner(final String label, final String imageName) {
  return Card(
    elevation: 1,
    color: Colors.white,
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(imageName.toString()))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0, top: 5.0),
            child: Text(
              label,
              style: GoogleFonts.nunito(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  );
}
