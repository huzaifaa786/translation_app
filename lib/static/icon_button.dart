// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:translation/values/colors.dart';


class IconsButton extends StatelessWidget {
  const IconsButton(
      {Key? key,
      @required this.title,
      @required this.onPressed,
      this.textcolor,
      this.icon,
      this.imgicon,
      this.iconTrue = true,
      this.screenRatio = 0.9,
      this.rounded = false,
      this.color = greenish})
      : super(key: key);

  final title;
  final imgicon;
  final iconTrue;
  final onPressed;
  final screenRatio;
  final color;
  final textcolor;
  final icon;
  final rounded;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * screenRatio,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: color,
          shadowColor: greenish,
          shape: RoundedRectangleBorder(
            borderRadius: rounded == true
                ? BorderRadius.all(Radius.circular(45))
                : BorderRadius.all(Radius.circular(6)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.my_location_rounded,color: white),
            ),
            Text(
              title,
              style: TextStyle(
                color: textcolor,
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
