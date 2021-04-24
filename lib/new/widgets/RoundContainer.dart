import 'package:flutter/material.dart';

class RoundContainer extends StatelessWidget {
  final Widget child;
  final int radius;
  final int hMargin;
  final int vMargin;
  final color;

  RoundContainer({this.child,this.hMargin=32,this.vMargin=8, this.radius = 10, this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: vMargin.toDouble(),horizontal: hMargin.toDouble()),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius.toDouble()), color: color),
      child: child,
    );
  }
}
