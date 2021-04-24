import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:markets/src/models/slide.dart';
class HomeSlider extends StatelessWidget {
  const HomeSlider({
    @required this.imagesUrlList,
    @required this.width,
    @required this.height,
    this.autoPlay = false,
    Key key,
  }) : super(key: key);

  final List<Slide> imagesUrlList;
  final double height;
  final double width;
  final bool autoPlay;
  @override
  Widget build(BuildContext context) {
    return Carousel(
      boxFit: BoxFit.cover,
      autoplay: true,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 1000),
      dotSize: 10,
      dotIncreaseSize:1.1,
      dotIncreasedColor: Colors.white,
      dotBgColor: Colors.transparent,
      dotColor: Colors.white.withOpacity(0.5),
      dotPosition: DotPosition.bottomCenter,
      dotVerticalPadding: 10.0,
      showIndicator: true,
      dotSpacing: 20,
      indicatorBgPadding: 20.0,

      images:imagesUrlList!=null? imagesUrlList.map((image) {
        return Builder(builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 18,horizontal: 18),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage( imageUrl: image.image.url,
                  width: width,
                  height: height,
                  fit: BoxFit.fill),
            ),
          );
        });
      }).toList():Container(),
    );
  }
}
