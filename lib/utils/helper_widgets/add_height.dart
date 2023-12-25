import 'package:flutter/material.dart';

import '../screen_helper.dart';

class AddHeight extends StatelessWidget {
  final double percentage;
  const AddHeight(
    this.percentage, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenHelper.getScreenHeight(context) * percentage,
    );
  }
}
