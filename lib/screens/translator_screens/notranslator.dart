import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:translation/screens/main_screen/home.dart';
import 'package:translation/static/titletopbar.dart';

class NoTransFound_screen extends StatefulWidget {
  const NoTransFound_screen({super.key});

  @override
  State<NoTransFound_screen> createState() => _NoTransFound_screenState();
}

class _NoTransFound_screenState extends State<NoTransFound_screen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              TitleTopbar(
                text: "Interpreters / Translators".tr,
                height: 0.1 / 0.9,
              ),
              // Row(
              //   children: [
              //     GestureDetector(
              //       onTap: () {
              //         Navigator.pushReplacement(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) => Home(),
              //             ));
              //       },
              //       child: Container(
              //         padding: EdgeInsets.only(left: 20, top: 20),
              //         child: GestureDetector(
              //             onTap: () {
              //               Navigator.pop(context);
              //             },
              //             child: SvgPicture.asset('assets/icons/back.svg')),
              //       ),
              //     ),
              //   ],
              // ),
              Container(
                height: MediaQuery.of(context).size.height * 0.75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/sadghost.png"),
                    SizedBox(height: 20),
                    Text(
                      'No Translator Found!'.tr,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
