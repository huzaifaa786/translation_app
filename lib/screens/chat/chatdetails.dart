import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:translation/screens/chat/chatcontroller.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/screens/chat/chats.dart';
import 'package:translation/static/chatcard.dart';
import 'package:translation/static/chattopbar.dart';
import 'package:translation/static/rplycharcard.dart';
import 'package:translation/values/controllers.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class Chatdetails_screen extends StatefulWidget {
  const Chatdetails_screen({super.key});

  @override
  State<Chatdetails_screen> createState() => _Chatdetails_screenState();
}

class _Chatdetails_screenState extends State<Chatdetails_screen> {
   onEvent(PusherEvent event) {
   log ("onEvent: $event");
    print('fdfddddddddddddfdfdffdfdfdfdfdfdfdfdf');
 
  }

  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  chatpusher() async {
    
       ;
  }

  @override
  void initState() {
    chatpusher();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: GetBuilder<ChatController>(
        builder: (controller) => Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 12),
          child: Column(
            children: [
              ChatTopBar(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        height: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Today',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      reverse: false,
                      // controller: _controllerrr,
                      scrollDirection: Axis.vertical,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        {
                          if (index == 2) {
                            return Container(height: 70);
                          }
                          if (index == 1) {
                            return ChatMessageCard(
                              id: '1',
                              user_id: 2,
                              msg:
                                  'Lorem ipsum dolor sit amet, consect adipiscing elit. Volutpat lacus pretium enim lacus sit amet at lectus amet.',
                              name: "3:03 PM",
                            );
                          } else {
                            return ReplyMessageCard(
                              msg:
                                  'Lorem ipsum dolor sit amet, consect adipiscing elit. Volutpat lacus pretium enim lacus sit amet at lectus amet.',
                            );
                          }
                        }
                      })),
              // Stack(
              //   children: <Widget>[
              //     Align(
              //       alignment: Alignment.bottomLeft,
              //       child: Container(
              //         padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              //         height: 60,
              //         width: double.infinity,
              //         color: Colors.white,
              //         child: Row(
              //           children: <Widget>[
              //             GestureDetector(
              //               onTap: () {},
              //               child: Container(
              //                 height: 30,
              //                 width: 30,
              //                 decoration: BoxDecoration(
              //                   color: Colors.lightBlue,
              //                   borderRadius: BorderRadius.circular(30),
              //                 ),
              //                 child: Icon(
              //                   Icons.add,
              //                   color: Colors.white,
              //                   size: 20,
              //                 ),
              //               ),
              //             ),
              //             SizedBox(
              //               width: 15,
              //             ),
              //             Expanded(
              //               child: TextField(
              //                 // controller: _controller,
              //                 decoration: InputDecoration(
              //                     hintText: "Write message...",
              //                     hintStyle: TextStyle(color: Colors.black54),
              //                     border: InputBorder.none),
              //               ),
              //             ),
              //             SizedBox(
              //               width: 15,
              //             ),
              //             FloatingActionButton(
              //               onPressed: () {
              //                 // log(id.toString());
              //                 // messagestore(id.toString());
              //                 // _controllerrr.animateTo(
              //                 //     _controllerrr.position.maxScrollExtent,
              //                 //     duration: Duration(milliseconds: 300),
              //                 //     curve: Curves.easeOut);
              //                 // _scrollUp();
              //                 // clearText();
              //               },
              //               child: Icon(
              //                 Icons.send,
              //                 color: Colors.white,
              //                 size: 18,
              //               ),
              //               backgroundColor: Colors.blue,
              //               elevation: 0,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    // height: 58,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: TextField(
                      onSubmitted: (value) {
                        chatController.sendmassage();
                        chatpusher();
                      },
                      controller: chatController.massage,
                      decoration: InputDecoration(
                        suffixIcon:
                            Icon(Icons.attach_file, color: Colors.black),
                        hintText: 'You message',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 8, top: 18),
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color.fromARGB(255, 51, 50, 50),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
