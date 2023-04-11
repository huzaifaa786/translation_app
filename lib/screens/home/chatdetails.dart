import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/screens/home/chats.dart';
import 'package:translation/static/chatcard.dart';
import 'package:translation/static/rplycharcard.dart';

class Chatdetails_screen extends StatefulWidget {
  const Chatdetails_screen({super.key});

  @override
  State<Chatdetails_screen> createState() => _Chatdetails_screenState();
}

class _Chatdetails_screenState extends State<Chatdetails_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Chats_screen()));
                    },
                    child: SvgPicture.asset("assets/icons/back.svg")),
                Container(
                  width: 55,
                  height: 55,
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Color(0xFF34607B)),
                    borderRadius: BorderRadius.circular(70),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: SvgPicture.asset(
                      "assets/images/splash_3.svg",
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 13.0),
                      child: Text(
                        "Cody Fisher",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 28.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF34607B),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            height: 12,
                            width: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Online',
                              style: TextStyle(
                                fontFamily: 'Sk-Modernist',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                height: 1.5,
                                color: Color(0xFF34607B),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 58.0),
                  child: PopupMenuButton(
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(child: Text('Option 1')),
                        PopupMenuItem(child: Text('Option 2')),
                        PopupMenuItem(child: Text('Option 3')),
                      ];
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
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
                          msg: 'How are you',
                          name: "3:03 PM",
                        );
                      } else {
                        return ReplyMessageCard(
                          msg: 'Hi I am farhan',
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
                width: 330,
                height: 58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.copy),
                    hintText: 'You message',
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  style: TextStyle(
                    fontFamily: 'Sk-Modernist',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.5,
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
    ));
  }
}
