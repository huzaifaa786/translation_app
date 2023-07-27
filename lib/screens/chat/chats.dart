import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:translation/screens/chat/chatdetails.dart';

import 'package:translation/static/chart.dart';
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
        Container(
          width: double.infinity,
          height: 141,
          decoration: BoxDecoration(
            color: Color(0xFF34607B),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(38, 68, 0, 0),
            child: Text(
              "Chats",
              style: TextStyle(
                fontFamily: 'Mazzard',
                fontWeight: FontWeight.w600,
                fontSize: 25,
                height: 1.5,
                color: Colors.white,
              ),
            ),
          ),
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
                    hintText: "Search ",
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
        Padding(
          padding: const EdgeInsets.only(left: 38.0),
          child: Row(
            children: [
              Text(
                "Messages",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
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
                            msg: 'Tap here to view messages',
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
                          "No Chat Found",
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
