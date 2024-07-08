import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:translation/screens/chat/chatdetails.dart';
import 'dart:ui' as ui;
import 'package:translation/static/chart.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/values/controllers.dart';

class Chats_screen extends StatefulWidget {
  const Chats_screen({super.key});

  @override
  State<Chats_screen> createState() => _Chats_screenState();
}

class _Chats_screenState extends State<Chats_screen> {
  @override
  void initState() {
    chatController.getContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: Get.height * 0.13,
            decoration: BoxDecoration(
                color: greenish,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Directionality(
              textDirection: ui.TextDirection.ltr,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 15, right: 16, left: 16, bottom: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [],
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Messages',
                          style: TextStyle(
                            fontFamily: 'Mazzard',
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Color.fromRGBO(0, 0, 0, 0.49),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    onChanged: chatController.searchContact,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search".tr,
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    style: TextStyle(
                      fontFamily: 'Sk-Modernist',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 1.5,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          chatController.scontacts.length != 0
              ? Flexible(
                  child: Container(
                    height: MediaQuery.of(context).size.height * .85,
                    child: ListView.builder(
                        itemCount: chatController.scontacts.length,
                        itemBuilder: (context, index) {
                          DateTime currentTime = DateTime.now();
                          String specificTimeString =
                              chatController.scontacts[index].lastmessageTime!;
                          DateTime specificTime =
                              DateFormat('yyyy-MM-dd HH:mm:ss')
                                  .parse(specificTimeString);
                          Duration difference =
                              currentTime.difference(specificTime);
                          String date =
                              DateFormat('yyyy-MM-dd').format(specificTime);
                          print(difference);
                          return ChartCards(
                              onPressed: () {
                                Get.to(() => Chatdetails_screen(
                                    id: chatController.scontacts[index].id,
                                    name: chatController
                                        .scontacts[index].username,
                                    profilePic: chatController
                                        .scontacts[index].profilePic,
                                    screen: 'chat'));
                              },
                              duration: difference.inSeconds < 60
                                  ? difference.inSeconds.toString() + ' sec ago'
                                  : difference.inMinutes < 60
                                      ? difference.inMinutes.toString() +
                                          ' min ago'
                                      : difference.inHours < 24
                                          ? difference.inHours.toString() +
                                              ' hour ago'
                                          : difference.inDays < 8
                                              ? difference.inDays.toString() +
                                                  ' day ago'
                                              : date,
                              msg: "Tap here to view messages".tr,
                              name: chatController.scontacts[index].username,
                              imgicon:
                                  chatController.scontacts[index].profilePic);
                        }),
                  ),
                )
              : Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .75,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(image: AssetImage('assets/images/chat 1.png')),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            "No Messages Found".tr,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
