// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:translation/values/colors.dart';

class LanguageCard extends StatelessWidget {
  const LanguageCard(
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
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 30,top: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 43,
                      height: 43,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 199, 193, 193),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          imgicon,
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "AR",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            const Divider(
              thickness: 1,
              height: 1,
              endIndent: 40,
              indent: 40,
              color: Color.fromARGB(255, 192, 180, 180),
            ),
          ],
        ),
      ),
    );
  }
}
