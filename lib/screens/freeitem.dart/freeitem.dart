import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:translation/screens/main_screen/home.dart';
import 'package:translation/static/freeitaminput.dart';
import 'package:translation/static/titletopbar.dart';

class FreeItem_screen extends StatefulWidget {
  const FreeItem_screen({super.key});

  @override
  State<FreeItem_screen> createState() => _FreeItem_screenState();
}

class _FreeItem_screenState extends State<FreeItem_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleTopbar(text: 'Free Item'),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "English",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Center(
                      child: SvgPicture.asset(
                        "assets/images/arrows.svg", // replace with your logo asset path
                        height: 38,
                        width: 38,
                      ),
                    ),
                    Text(
                      "Hindi",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FreeItemInput(
                text: 'type',
              ),
              const SizedBox(
                height: 15,
              ),
              FreeItemInput(
                text: 'type',
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/images/forward.svg", // replace with your logo asset path
                    height: 67,
                    width: 67,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
