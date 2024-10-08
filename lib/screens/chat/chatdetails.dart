import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:io' as io;
import 'package:translation/screens/chat/chatcontroller.dart';
import 'package:translation/static/chattopbar.dart';
import 'package:translation/static/rplycharcard.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/values/controllers.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class Chatdetails_screen extends StatefulWidget {
  const Chatdetails_screen(
      {super.key,
      this.id,
      required this.name,
      required this.profilePic,
      this.screen});
  final String? id;
  final String? name;
  final String? profilePic;
  final String? screen;

  @override
  State<Chatdetails_screen> createState() => _Chatdetails_screenState();
}

class _Chatdetails_screenState extends State<Chatdetails_screen> {
  GetStorage box = GetStorage();
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();

  msg() async {
    await chatController.makeseen(widget.id!);
    await chatController.unseenchat();
  }

  @override
  void initState() {
    chatController.massages = RxList([]);
    msg();
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

  Future<bool> checkFileExistance(int index) async {
    var fileExist = await io.File('/storage/emulated/0/Download/' +
            chatController.massages[chatController.massages.length - 1 - index]
                .file_title!)
        .exists();
    return fileExist;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
          body: SafeArea(
        child: GetBuilder<ChatController>(
          builder: (controller) => Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // padding: EdgeInsets.only(top: 12),
            child: Column(
              children: [
                ChatTopBar(
                  name: widget.name,
                  img: widget.screen == 'order'
                      ? widget.profilePic
                      : 'https://translation.ezmoveportal.com/' +
                          widget.profilePic!,
                ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Expanded(
                //         child: Divider(
                //           color: Colors.grey,
                //           height: 1,
                //         ),
                //       ),
                //       // Padding(
                //       //   padding: EdgeInsets.symmetric(horizontal: 10),
                //       //   // child: Text(
                //       //   //   'Today',
                //       //   //   style: TextStyle(
                //       //   //     fontWeight: FontWeight.bold,
                //       //   //     color: Colors.grey,
                //       //   //   ),
                //       //   // ),
                //       // ),
                //       Expanded(
                //         child: Divider(
                //           color: Colors.grey,
                //           height: 1,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Expanded(
                    child: ListView.builder(
                        reverse: true, // Set reverse to true
                        itemCount: controller.massages.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          bool fileExist = false;
                          checkFileExistance(index)
                              .then((value) => fileExist = value);
                          print(fileExist);
                          return ReplyMessageCard(
                            msg: controller
                                .massages[
                                    controller.massages.length - 1 - index]
                                .body
                                .toString(), // Reverse the index
                            Time: getTime(controller
                                .massages[
                                    controller.massages.length - 1 - index]
                                .dateTime), // Reverse the index
                            sender: controller
                                        .massages[controller.massages.length -
                                            1 -
                                            index]
                                        .to_id ==
                                    widget.id
                                ? false
                                : true,
                            fileName: controller
                                .massages[
                                    controller.massages.length - 1 - index]
                                .file_name,
                            fileType: controller
                                .massages[
                                    controller.massages.length - 1 - index]
                                .file_type,
                            fileTitle: controller
                                .massages[
                                    controller.massages.length - 1 - index]
                                .file_title,
                            fileExist: fileExist,
                          );
                        })),
                Stack(
                  children: [
                    Directionality(
                      textDirection: box.read('locale') != 'ar'
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        // height: 58,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: lightblue),
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: TextField(
                          onSubmitted: (value) {
                            if (value.trim().isNotEmpty) {
                              // Check if the value is not empty or only contains whitespace
                              chatController.sendMassage();
                            }
                            setState(() {});
                          },
                          controller: chatController.massagecontroller,
                          decoration: InputDecoration(
                            suffixIcon: Row(
                              children: [
                                InkWell(
                                    onTap: () {
                                      controller.picksinglefile();
                                    },
                                    child: Icon(Icons.attach_file,
                                        color: Colors.black)),
                                SizedBox(
                                  width: 3,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (chatController.massagecontroller.text
                                        .trim()
                                        .isNotEmpty) {
                                      chatController.sendMassage();
                                    }
                                  },
                                  child: SvgPicture.asset(
                                    "assets/icons/send_icon.svg",
                                    width: 26,
                                    height: 28,
                                    color: greenish,
                                  ),
                                ),
                              ],
                            ),
                            hintText: 'You message'.tr,
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.only(left: 8, top: 18, right: 8),
                          ),
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color.fromARGB(255, 51, 50, 50),
                          ),
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
      )),
    );
  }
}
