import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:translation/screens/chat/chats.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ChatTopBar extends StatelessWidget {
  const ChatTopBar({super.key, this.name, this.img});
  final name;
  final img;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
                margin: EdgeInsets.only(left: 12),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Color(0xFF34607B)),
                  borderRadius: BorderRadius.circular(70),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: img == 'https://translation.ezmoveportal.com/'
                      ? Image(
                          image: AssetImage('assets/images/5907.jpg'),
                          height: 64,
                          width: 64,
                        )
                      : CachedNetworkImage(
                          imageUrl: img,
                          height: 64,
                          width: 64,
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w500),
                      ),
                      // Row(
                      //   children: [
                      //     Container(
                      //       decoration: BoxDecoration(
                      //         color: Color(0xFF34607B),
                      //         borderRadius: BorderRadius.circular(999),
                      //       ),
                      //       height: 12,
                      //       width: 12,
                      //     ),
                      //     Padding(
                      //       padding: const EdgeInsets.only(left: 5.0),
                      //       child: Text(
                      //         'Online',
                      //         style: TextStyle(
                      //           fontFamily: 'Sk-Modernist',
                      //           fontWeight: FontWeight.w400,
                      //           fontSize: 12,
                      //           height: 1.5,
                      //           color: Color(0xFF34607B),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 58.0),
          //   child: 
            // PopupMenuButton(
            //   itemBuilder: (BuildContext context) {
            //     return [
            //       PopupMenuItem(child: Text('Option 1')),
            //       PopupMenuItem(child: Text('Option 2')),
            //       PopupMenuItem(child: Text('Option 3')),
            //     ];
            //   },
            // ),
          // ),
        ],
      ),
    ));
  }
}
