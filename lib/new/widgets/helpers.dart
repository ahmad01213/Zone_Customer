import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const mainColor = Colors.black;
const secondColor = Color(0xFFFCDA00);
const textColor = Color(0xFF343A40);

replacePage({context, page}) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => page));
}

pushPage({context, page}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}


List<String> imgs = [
  "4.png",
  "3.png",
  "4.png",
  "2.png",
  "3.png",
  "2.png",
  "3.png",
  "4.png",
  "2.png",
  "3.png",
  "2.png",
  "3.png",
  "4.png",
  "2.png",
  "3.png",
  "2.png",
  "3.png",
  "4.png",
  "2.png",
  "3.png",
  "2.png",
  "3.png",
  "4.png",
  "2.png",
  "3.png",
  "2.png",
  "3.png",
  "4.png",
  "2.png",
  "3.png",
  "2.png",
  "3.png",
  "4.png",
  "2.png",
  "3.png",
  "2.png",
  "3.png",
  "4.png",
  "2.png",
  "3.png",
  "2.png",
  "3.png",
  "4.png",
  "2.png",
  "3.png",
  "2.png",
  "3.png",
  "4.png",
  "2.png",
  "3.png",
];