// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../values/colors.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton(
      {Key? key,
      @required this.title,
      @required this.onPressed,
      this.text,
      this.textcolor,
      this.icon,
      this.sreenRatio = 0.9,
      this.buttonwidth = 0.37,
      this.color = primaryTextColor})
      : super(key: key);

  final title;
  final onPressed;
  final sreenRatio;
  final color;
  final text;
  final textcolor;
  final icon;
  final buttonwidth;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * buttonwidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 34,
                width: 30,
                child: Column(
                  children: [Image.asset(icon)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
