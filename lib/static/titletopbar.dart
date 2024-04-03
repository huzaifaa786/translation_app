// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translation/values/colors.dart';

class TitleTopbar extends StatelessWidget {
  const TitleTopbar({
    super.key,
    this.text,
    this.ontap,
  });
  final text;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.1,
      decoration: BoxDecoration(
          color: greenish,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 15, right: 16, left: 16, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: ontap,
                child: Container(
                  decoration: BoxDecoration(
                    color: white,
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(60),
                    ),
                  ),
                  child: Icon(
                    size: 32,
                    Icons.keyboard_arrow_left_outlined,
                  ),
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  fontFamily: 'Mazzard',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: white,
                ),
              ),
              Text(
                '.............',
                style: TextStyle(color: greenish),
              )
            ],
          ),
        ),
      ),
    );
  }
}
