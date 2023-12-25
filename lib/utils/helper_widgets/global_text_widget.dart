import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarServicesTextWidget extends StatelessWidget {
  final String text;
  final TextStyle style;
  const CarServicesTextWidget(
      {required this.text, required this.style, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      style: style,
    );
  }
}
