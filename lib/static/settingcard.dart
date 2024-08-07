// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/values/colors.dart';

class SettingCard extends StatelessWidget {
  const SettingCard(
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
    GetStorage box = GetStorage();
    return Directionality(
      textDirection:
          box.read('locale') == 'ar' ? TextDirection.rtl : TextDirection.ltr,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.only(top: 12, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          // color: greenish.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            imgicon,
                            color: greenish,
                            height: 38,
                            width: 38,
                          ),
                        ),
                      ),
                      Padding(
                        padding: box.read('locale') != 'ar'
                            ? const EdgeInsets.only(left: 25)
                            : EdgeInsets.only(right: 25),
                        child: Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  box.read('locale') == 'ar'
                      ? Container(
                          decoration: BoxDecoration(
                            color: greenish,
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                          ),
                          child: Icon(
                            size: 27,
                            Icons.keyboard_arrow_left,
                            color: Colors.white,
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            color: greenish,
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                size: 27,
                                Icons.keyboard_arrow_right,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              const Divider(
                thickness: 2,
                height: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
