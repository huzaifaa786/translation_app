import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:translation/values/colors.dart';

class SearchTopBar extends StatelessWidget {
  const   SearchTopBar({super.key,this.controller,this.onchange});
  final onchange;
  final controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey[300]!,
              blurRadius: 15.0,
              spreadRadius: 6.0,
              offset: Offset(5.0, 5.0))
        ],
      ),
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                Get.back();
              },
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: SvgPicture.asset('assets/icons/back.svg',
                    height: 40, width: 40),
              )),
          Container(
            child: Container(
              width: 210,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200],
              ),
              child: TextField(
                onChanged: onchange,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey[300]!),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey[300]!),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  hintText: 'Search People'.tr,
                  contentPadding: EdgeInsets.only(left: 12),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
          ),
          Container(
            width: 57,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xFF34607B),
            ),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
