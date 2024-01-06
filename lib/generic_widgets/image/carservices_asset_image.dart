import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarServicesAssetImage extends StatelessWidget {
  final String imagePath;
  final BoxFit fit;

  final double? height, width;

  const CarServicesAssetImage({
    Key? key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imagePath.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(
        imagePath,
        semanticsLabel: 'SVG Image',
        fit: fit,
        width: width,
        height: height,
      );
    } else if (imagePath.toLowerCase().endsWith('.png')) {
      return Image.asset(
        imagePath,
        fit: BoxFit.contain,
        scale: 2,
      );
    } else {
      return const Icon(
        Icons.error_outline,
      );
    }
  }
}

// Example usage:
// AssetImageLoader(imageName: 'your_image_name.svg or your_image_name.png')
