// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:translation/values/colors.dart';

class TitleTopbar extends StatelessWidget {
  TitleTopbar({
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
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 15, right: 16, left: 16, bottom: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('ddddddddddddddddddddd');
                      Get.back();
                    },
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

                  // Text(
                  //   '.............',
                  //   style: TextStyle(color: greenish),
                  // )
                ],
              ),
              Gap(6),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontFamily: 'Pop',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
