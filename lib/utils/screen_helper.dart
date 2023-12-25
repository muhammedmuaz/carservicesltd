import 'package:flutter/material.dart';

import '../const/data_const.dart';

class ScreenHelper {
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.sizeOf(context).height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }

  static double getScreenWidthWithoutHorizontalPadding(BuildContext context) {
    return (MediaQuery.sizeOf(context).width) -
        (DataConstants.kScreenHorizontalPadding * 2);
  }
}
