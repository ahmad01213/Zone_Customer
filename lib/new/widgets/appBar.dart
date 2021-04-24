import 'package:flutter/material.dart';
import 'Texts.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  CustomAppBar(this.title);
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(60),
      child: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 24,
                  color: Colors.white,
                )),
            Texts(
              title: title,
              fSize: 20,
              color: Colors.white,
              weight: FontWeight.bold,
            ),
            SizedBox()
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
