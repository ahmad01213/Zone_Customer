import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.width/8;
    var paint = Paint();
    paint.style = PaintingStyle.fill;
    paint.color=Colors.white;
    var path = Path();
    path.moveTo(0,  height);
    path.quadraticBezierTo( size.width*0.05,0,  size.width*0.2,
        0);
    path.lineTo( size.width*0.8,0, );
    path.quadraticBezierTo( size.width*0.95,0,
        size.width,- height);
    path.lineTo( size.width,  height);
    path.lineTo(0,  height);
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}