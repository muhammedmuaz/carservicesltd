import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final double rating;
  final double size;
  int? ratingcount;
  RatingBar({required this.rating, this.ratingcount, this.size = 18});

  @override
  Widget build(BuildContext context) {
    List<Widget> _starList = [];
    int realNumber = rating.floor();
    int partNumber = ((rating - realNumber) * 10).ceil();

    for (var i = 0; i <= 5; i++) {
      if (i < realNumber) {
        _starList.add(Icon(
          Icons.star,
          color: Colors.amber,
          size: size,
        ));
      }
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _starList,
    );
  }
}
