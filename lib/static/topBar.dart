// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:translation/values/colors.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, this.onFavTap, this.onNotiTap, this.onProfileTap});
  final onNotiTap;
  final onFavTap;
  final onProfileTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: AssetImage("assets/images/splashLogo.png"),
            color: white,
            height: 30,
            width: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: onFavTap,
                child: Icon(
                  Icons.favorite,
                  color: white,
                ),
              ),
              SizedBox(width: 8),
              InkWell(
                onTap: onNotiTap,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: SvgPicture.asset(
                    'assets/images/bell.svg',
                    color: white,
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
              // InkWell(
              //   onTap: onProfileTap,
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(45),
              //     child: Image.asset(
              //       'assets/images/placeholder.png',
              //       height: 35,
              //       width: 35,
              //       fit: BoxFit.fill,
              //     ),
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}
