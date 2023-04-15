import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:translation/screens/notification/notification.dart';
import 'package:translation/static/large_button.dart';

import '../../../../values/colors.dart';

class CardAdded_Screen extends StatefulWidget {
  const CardAdded_Screen({super.key});

  @override
  State<CardAdded_Screen> createState() => _CardAdded_ScreenState();
}

class _CardAdded_ScreenState extends State<CardAdded_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 130,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SvgPicture.asset(
              "assets/images/tick.svg", // replace with your logo asset path
              height: 170,
              width: 170,
            ),
          ),
        ),
        Container(
          width: 302,
          height: 70,
          margin: EdgeInsets.only(left: 0, top: 80),
          alignment: Alignment.center,
          decoration: BoxDecoration(),
          child: Text(
            'You have successfully placed your order.',
            style: TextStyle(
              fontFamily: 'Mazzard',
              fontWeight: FontWeight.w500,
              fontSize: 25,
              height: 1.4,
              color: Color.fromRGBO(0, 0, 0, 0.75),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Center(
              child: LargeButton(
            title: 'Go back',
            sreenRatio: 0.8,
            onPressed: () {
              setState(() {});

              // authController.signIn();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Notification_screen(),
                  ));
            },
            color: greenish,
            textcolor: Colors.white,
            buttonWidth: 0.95,
          )),
        ),
      ]),
    );
  }
}
