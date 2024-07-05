// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translation/values/colors.dart';

class TitleTopbarr extends StatelessWidget {
  const TitleTopbarr({
    super.key,
    this.text,
    this.ontap,
    this.height = 0.1,
  });
  final text;
  final ontap;
  final height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * height,
      decoration: BoxDecoration(
          color: greenish,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          )),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 15, right: 16, left: 16, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontFamily: 'Mazzard',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
