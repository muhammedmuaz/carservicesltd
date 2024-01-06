import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:services_app/generic_widgets/image/carservices_asset_image.dart';

class CarServicesNetworkImage extends StatelessWidget {
  final String imagePath;
  final BoxFit fit;
  final BoxFit errorAndPlaceHolderFit;
  final double paddingValue;

  const CarServicesNetworkImage(
      {Key? key,
      required this.imagePath,
      this.fit = BoxFit.contain,
      this.errorAndPlaceHolderFit = BoxFit.contain,
      this.paddingValue = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imageUrl = imagePath;
    final noImage = CarServicesAssetImage(
      imagePath: 'assets/image_placeholder.svg',
      fit: errorAndPlaceHolderFit,
    );

    if (imagePath.isEmpty || imagePath == '') {
      return noImage;
    }

    if (imagePath.toLowerCase().contains('.svg')) {
      return SvgPicture.network(
        imageUrl,
        fit: fit,
        placeholderBuilder: (context) => CarServicesAssetImage(
          imagePath: 'assets/image_placeholder.svg',
          fit: errorAndPlaceHolderFit,
        ),
      );
    }
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => CarServicesAssetImage(
        imagePath: 'assets/image_placeholder.svg',
        fit: errorAndPlaceHolderFit,
      ),
      errorWidget: (context, url, error) => noImage,
      fit: errorAndPlaceHolderFit,
    );
  }
}
