import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:translation/screens/chat/chatdetails.dart';

import 'package:translation/static/chart.dart';
import 'package:translation/static/titletopbar.dart';
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
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: Get.height * 0.2,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 16, 54, 78),
                borderRadius: BorderRadius.only(
                    // bottomLeft: Radius.circular(25),
                    // bottomRight: Radius.circular(25)
                    ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(38, 68, 38, 0),
                child: Text(
                  "Messages".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Mazzard',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    height: 1.5,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),

        Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(31, 20, 28, 20),
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
        // Padding(
        //   padding: const EdgeInsets.only(left: 38.0, right: 38),
        //   child: Row(
        //     children: [
        //       Text(
        //         "Messages".tr,
        //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        //       ),
        //     ],
        //   ),
        // ),
        chatController.scontacts.length != 0
            ? Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * .75,
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
                                  name:
                                      chatController.scontacts[index].username,
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
    ));
  }
}
