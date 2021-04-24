import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarWidget extends StatelessWidget {
  final bool ignorGesture;
  final double ratingValue;
  final int itemSize;
  final emptColor;
  final direction;
  final fillColor;
  RatingBarWidget({this.ignorGesture = true,this.itemSize=23,this.direction=TextDirection.ltr, this.ratingValue,this.emptColor=Colors.grey,this.fillColor=Colors.yellow});

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: ratingValue.toDouble(),
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemSize: itemSize.toDouble(),
      itemCount: 5,
      textDirection: direction,
      ignoreGestures: ignorGesture,
      ratingWidget: RatingWidget(
        full: Image.asset(
          'assets/images/star.png',
          color: fillColor,
        ),
        half: Image.asset(
          'assets/images/star_half.png',
        ),
        empty: Image.asset(
          'assets/images/star.png',
          color: emptColor,
        ),
      ),
      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
    ;
  }
}
