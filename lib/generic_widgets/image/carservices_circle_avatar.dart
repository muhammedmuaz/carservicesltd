import 'package:flutter/material.dart';

import 'carservices_asset_image.dart';
import 'carservices_network_image.dart';

class CarServicesCircleAvatar extends StatelessWidget {
  final String? image;
  final String? placeholder;
  final double? radius;
  final Color? backgroundColor;
  const CarServicesCircleAvatar({
    Key? key,
    required this.image,
    this.radius,
    this.placeholder,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget setBackgroundImage(String? image) {
      if (image == null || image.isEmpty) {
        return CarServicesAssetImage(
          imagePath: placeholder ?? 'assets/image_placeholder.svg',
        );
      }
      if (image.contains('assets')) {
        return CarServicesAssetImage(imagePath: image);
      }
      return CarServicesNetworkImage(imagePath: image);
    }

    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      child: ClipOval(
        clipBehavior: Clip.antiAlias,
        child: setBackgroundImage(image),
      ),
    );
  }
}
