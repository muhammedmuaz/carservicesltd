import 'package:flutter/material.dart';

class CarServicesProgressIndicator extends StatelessWidget {
  const CarServicesProgressIndicator(
      {this.color = const Color(0xff2a9d8f), Key? key})
      : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
