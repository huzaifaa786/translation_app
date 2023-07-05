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
import 'package:translation/models/msg.dart';

class Chatdetails_screen extends StatefulWidget {
  const Chatdetails_screen({super.key, this.id});
  final String? id;
  @override
  State<Chatdetails_screen> createState() => _Chatdetails_screenState();
}

class _Chatdetails_screenState extends State<Chatdetails_screen> {
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();

  @override
  void initState() {
    chatController.initPusher(widget.id);
    chatController.fetchmassage(widget.id);
    super.initState();
  }

  @override
  void dispose() {
    pusher.disconnect();
    pusher.unsubscribe(channelName: "private-chatify.${widget.id}");
    super.dispose();
  }
  String getTime(DateTime? dateTime) {
  if (dateTime != null) {
    return TimeOfDay.fromDateTime(dateTime.toLocal()).format(context);
  } else {
    return '';
  }
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
                      itemCount: controller.massages.length,
                      // controller: _controllerrr,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => ReplyMessageCard(
                            msg: controller.massages[index].body.toString(),
                              Time: getTime(controller.massages[index].dateTime),
                            sender:
                                controller.massages[index].to_id == widget.id
                                    ? false
                                    : true,
                          ))),
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
                        setState(() {});
                      },
                      controller: chatController.massagecontroller,
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
