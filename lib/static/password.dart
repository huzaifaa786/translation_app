// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';

class ChangePassword extends StatelessWidget {
  GetStorage box = GetStorage();

  ChangePassword(
      {super.key,
      this.title,
      this.ontap,
      this.onPressed,
      this.discription,
      this.image,
      this.extra = false,
      this.services});
  final title;
  final ontap;
  final onPressed;
  final discription;
  final image;
  final bool extra;
  final Widget? services;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 15, left: 20, right: 20),
      child: Directionality(
        textDirection:
            box.read('locale') == 'ar' ? TextDirection.rtl : TextDirection.ltr,
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Image.asset("assets/images/Private Lock.png"),
                  SizedBox(
                    width: 52,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: 'Poppins'),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
