import 'package:flutter/material.dart';
import 'package:services_app/generic_widgets/image/carservices_network_image.dart';

class CarServicesProfilePhotoCoverPhoto extends StatelessWidget {
  const CarServicesProfilePhotoCoverPhoto({
    Key? key,
    required this.coverPhotoHeight,
    required this.profilePhotoTopPosition,
    required this.width,
    required this.profilePhotoRadius,
    required this.profilePhotoUrl,
    required this.coverPhoto,
  }) : super(key: key);

  final double coverPhotoHeight;
  final double profilePhotoTopPosition;
  final double width;
  final double profilePhotoRadius;
  final String profilePhotoUrl;
  final String coverPhoto;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomLeft,
      children: [
        SizedBox(
          height: coverPhotoHeight,
          width: double.infinity,
          child: CarServicesNetworkImage(
            fit: BoxFit.cover,
            imagePath: coverPhoto,
          ),
        ),
        Positioned(
          top: profilePhotoTopPosition,
          child: Container(
            margin: const EdgeInsets.only(
              left: 16,
            ),
            height: profilePhotoRadius,
            width: profilePhotoRadius,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CarServicesNetworkImage(
                imagePath: profilePhotoUrl,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
