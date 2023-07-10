// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:translation/values/colors.dart';

class TitleTopbarr extends StatelessWidget {
  const TitleTopbarr({
    super.key,
    this.text,
    this.ontap,
  });
  final text;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, right: 16, left: 16 ,bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         
            Text(
              text,
              style: TextStyle(
                fontFamily: 'Mazzard',
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
