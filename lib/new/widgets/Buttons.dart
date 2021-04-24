import 'package:flutter/material.dart';

import 'helpers.dart';


class Buttons extends StatelessWidget {
  final title;
  final int width;
  final int fSize;
  final textColol;
  final bool shadow;
  final bgColor;
  final int radius;
  final int horizontalMargin;
  Function onPressed;
  Buttons({this.title,this.fSize =15,this.radius=50, this.onPressed,this.horizontalMargin=0,this.width,this.bgColor = mainColor,this.textColol=Colors.white,this.shadow=true});
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        onPressed();
      },
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin.toDouble()),
        width: width!=null?width.toDouble():double.infinity,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radius.toDouble()),
          boxShadow:shadow? [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ]:[],
        ),
        child: Center(
            child: Text(
             title,
              style: TextStyle(
                  fontSize: fSize.toDouble(),
                  color: textColol,
                  ),
            )),
      ),
    );

  }
}
