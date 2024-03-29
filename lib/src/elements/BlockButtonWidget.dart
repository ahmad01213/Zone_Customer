import 'package:flutter/material.dart';

class BlockButtonWidget extends StatelessWidget {
  const BlockButtonWidget({Key key, @required this.color, @required this.text, @required this.onPressed}) : super(key: key);

  final Color color;
  final Text text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: MaterialButton(
        elevation: 0,
        onPressed: this.onPressed,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
        color: this.color,
        shape: StadiumBorder(),
        child: this.text,
      ),
    );
  }
}
