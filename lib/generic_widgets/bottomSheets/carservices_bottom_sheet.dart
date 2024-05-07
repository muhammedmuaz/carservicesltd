import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/helper_widgets/add_height.dart';

class CarServicesBottomModalSheet extends StatelessWidget {
  final String title;
  final Widget content;
  final EdgeInsets? padding;
  final VoidCallback? onClose;

  const CarServicesBottomModalSheet({
    Key? key,
    required this.title,
    required this.content,
    this.padding,
    this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              IconButton(
                icon: const Icon(
                  Icons.close_rounded,
                  size: 30,
                ),
                onPressed: () {
                  onClose?.call();
                  Get.back();
                },
              ),
            ],
          ),
        ),
        const AddHeight(
          0.01,
        ),
        Padding(
          padding: padding ??
              const EdgeInsets.symmetric(
                horizontal: 16,
              ),
          child: content,
        ),
      ],
    );
  }
}
