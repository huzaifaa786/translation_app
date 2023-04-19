import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:translation/screens/notification/notification_card.dart';
import 'package:translation/screens/translator_screens/offline_translator/offline_modal.dart';
import 'package:translation/screens/translator_screens/offline_translator/offline_people.dart';
import 'package:translation/static/noti_card.dart';
import 'package:translation/static/titletopbar.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/screens/main_screen/home.dart';
import 'package:translation/static/large_button.dart';

class Notification_screen extends StatefulWidget {
  const Notification_screen({super.key});

  @override
  State<Notification_screen> createState() => _Notification_screenState();
}

class _Notification_screenState extends State<Notification_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8,right: 8),
          child: Column(
            children: [
              TitleTopbar(
                text: 'Notification',
                ontap: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                  padding: const EdgeInsets.only(left: 1, right: 1, top: 12),
                  height: 100,
                  child: NotificationTile(
                    title: 'your order has been accepted',
                    name: 'Fira Jonce',
                    ontap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(40),
                          ),
                        ),
                        builder: (context) =>
                            Wrap(children: [NotificationModal()]),
                      );
                    },
                  )),
                    Container(
                  padding: const EdgeInsets.only(left: 1, right: 1, top: 12),
                  height: 100,
                  child: NotificationTile(
                      title: 'your order has been accepted',
                    name: 'Fira Jonce',
                    ontap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(40),
                          ),
                        ),
                        builder: (context) =>
                            Wrap(children: [NotificationModal()]),
                      );
                    },
                  )),
                    Container(
                  padding: const EdgeInsets.only(left: 1, right: 1, top: 12),
                  height: 100,
                  child: NotificationTile(
                    title: 'your order has been accepted',
                    name: 'Fira Jonce',
                    ontap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(40),
                          ),
                        ),
                        builder: (context) =>
                            Wrap(children: [NotificationModal()]),
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
