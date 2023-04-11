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
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: onFavTap,
                  child: Icon(
                    Icons.favorite,
                    color: white,
                  ),
                ),
                InkWell(
                  onTap: onNotiTap,
                  child: SvgPicture.asset(
                    'assets/images/bell.svg',
                    color: white,
                  ),
                ),
                InkWell(
                  onTap: onProfileTap,
                  child: SvgPicture.asset(
                    'assets/images/profile.svg',
                    color: white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
