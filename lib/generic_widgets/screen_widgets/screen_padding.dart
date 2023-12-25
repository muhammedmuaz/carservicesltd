import 'package:flutter/material.dart';
import '../../const/data_const.dart';

class ScreenPadding extends StatelessWidget {
  final double top;
  final double bottom;
  final double horizontalPadding;
  final Widget child;
  const ScreenPadding({
    Key? key,
    required this.child,
    this.top = 0.0,
    this.bottom = 0.0,
    this.horizontalPadding = DataConstants.kScreenHorizontalPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: horizontalPadding,
        left: horizontalPadding,
        top: top,
        bottom: bottom,
      ),
      child: child,
    );
  }
}
