import 'package:flutter/material.dart';
import 'package:services_app/const/design_const.dart';

class HalalDivider extends StatelessWidget {
  final double? height;
  final double? thickness;
  const HalalDivider({Key? key, this.height, this.thickness = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness,
      height: height,
      color: DesignConstants.kDividerGreyColor,
    );
  }
}
