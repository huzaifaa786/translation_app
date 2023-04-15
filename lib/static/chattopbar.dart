import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:translation/screens/chat/chats.dart';

class ChatTopBar extends StatelessWidget {
  const ChatTopBar({super.key});

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
                  child: Image.asset(
                    "assets/images/placeholder.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cody Fisher",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                    ),
                    Row(
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
    ));
  }
}
