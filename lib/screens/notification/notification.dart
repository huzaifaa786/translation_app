import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:translation/models/notification.dart';
import 'package:translation/screens/notification/notification_card.dart';
import 'package:translation/screens/notification/notificationcontroller.dart';
import 'package:translation/screens/translator_screens/offline_translator/offline_modal.dart';
import 'package:translation/screens/translator_screens/offline_translator/offline_people.dart';
import 'package:translation/static/noti_card.dart';
import 'package:translation/static/titletopbar.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/screens/main_screen/home.dart';
import 'package:translation/static/large_button.dart';
import 'package:translation/values/controllers.dart';

class Notification_screen extends StatefulWidget {
  const Notification_screen({super.key});

  @override
  State<Notification_screen> createState() => _Notification_screenState();
}

class _Notification_screenState extends State<Notification_screen> {
  fetchNoti() async {
    await notificationController.getnoti();
    setState(() {});
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
              text: 'Notifications',
              ontap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 23,
            ),
            controller.notifications.length != 0
                ? Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Flexible(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.81,
                        child: ListView.builder(
                            itemCount: controller.notifications.length,
                            itemBuilder: (context, index) => NotificationTile(
                                  ontap: controller.notifications[index].orderr!
                                              .status ==
                                          '3'
                                      ? () {
                                          showModalBottomSheet(
                                            context: context,
                                            isScrollControlled: true,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(40),
                                              ),
                                            ),
                                            builder: (context) => Wrap(
                                                children: [
                                                  NotificationModal(
                                                      notification: controller
                                                          .notifications[index])
                                                ]),
                                          );
                                        }
                                      : () {},
                                  name: controller
                                      .notifications[index].vendor!.username,
                                  image: controller
                                      .notifications[index].vendor!.profilePic,
                                  title: controller.notifications[index].title,
                                  status: controller
                                      .notifications[index].orderr!.status,
                                )),
                      ),
                    ),
                  )
                : Flexible(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.81,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("No Notification Found!"),
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
