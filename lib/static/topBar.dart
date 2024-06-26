// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/screens/favorites_screen/favorites.dart';
import 'package:translation/screens/notification/notification.dart';
import 'package:translation/values/colors.dart';
import 'package:get/get.dart';
import 'package:translation/values/controllers.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key, this.onProfileTap});
  final onProfileTap;

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  bool? checkNoti = false;

  checkNotifications() async {
    GetStorage box = GetStorage();
    String authCheck = box.read('api_token');
    if (authCheck.isNotEmpty) {
      var mcheckNotification = await homeController.CheckNotications();
      setState(() {
        checkNoti = mcheckNotification;
      });
    } else {}
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      checkNotifications();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image(
          //   image: AssetImage("assets/images/splashLogo.png"),
          //   color: white,
          //   height: 30,
          //   width: 30,
          // ),
          Text(
            "..........",
            style: TextStyle(color: greenish),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Get.to(() => Favorites_screen())!.then((value) {
                    print('******************');
                    // checkNotifications();
                  });
                },
                child: Icon(
                  Icons.favorite,
                  color: white,
                ),
              ),
              SizedBox(width: 8),
              Stack(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Get.to(() => Notification_screen())!.then((value) {
                        checkNotifications();
                      });
                    },
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SvgPicture.asset(
                        'assets/images/bell.svg',
                        color: white,
                        height: 28,
                        width: 28,
                      ),
                    ),
                  ),
                  checkNoti != false
                      ? Positioned(
                          right: 3,
                          top: 3,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
