import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:translation/screens/notification/notification_card.dart';
import 'package:translation/screens/notification/notificationcontroller.dart';
import 'package:translation/static/noti_card.dart';
import 'package:translation/static/titletopbar.dart';
import 'package:translation/values/controllers.dart';

class Notification_screen extends StatefulWidget {
  const Notification_screen({super.key});

  @override
  State<Notification_screen> createState() => _Notification_screenState();
}

class _Notification_screenState extends State<Notification_screen> {
  fetchNoti() async {
    await notificationController.getnoti();
    // setState(() {});
  }

  readnotification() async {
    await notificationController.readnotifications();
    setState(() {});
  }

  @override
  void initState() {
    fetchNoti();
    readnotification();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: GetBuilder<NotificationController>(
        builder: (controller) => Column(
          children: [
            TitleTopbar(
              text: 'Notifications'.tr,
              ontap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 8,
            ),
            controller.notifications.length != 0
                ? Flexible(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.88,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: ListView.builder(
                          itemCount: controller.notifications.length,
                          itemBuilder: (context, index) => NotificationTile(
                                ontap: () {},
                                // ontap: controller.notifications[index].orderr !=
                                //         null
                                //     ? controller.notifications[index].orderr!
                                //                 .status ==
                                //             '3'
                                //         ? () {
                                //             showModalBottomSheet(
                                //               context: context,
                                //               isScrollControlled: true,
                                //               shape:
                                //                   const RoundedRectangleBorder(
                                //                 borderRadius:
                                //                     BorderRadius.vertical(
                                //                   top: Radius.circular(40),
                                //                 ),
                                //               ),
                                //               builder: (context) =>
                                //                   Wrap(children: [
                                //                 // NotificationModal(
                                //                 //     notification: controller
                                //                 //         .notifications[index])
                                //               ]),
                                //             );
                                //           }
                                //         : () {}
                                //     : () {},
                                name: controller
                                    .notifications[index].vendor!.username,
                                serviceType: controller
                                    .notifications[index].service_type,
                                image: controller
                                    .notifications[index].vendor!.profilePic,
                                title: controller.notifications[index].title,
                                status:
                                    controller.notifications[index].orderr !=
                                            null
                                        ? controller
                                            .notifications[index].orderr!.status
                                        : '',
                              )),
                    ),
                  )
                : Flexible(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.81,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.75,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/images/smiley.svg"),
                                SizedBox(height: 20),
                                Text(
                                  'No Notification Found'.tr,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      )),
    );
  }
}
