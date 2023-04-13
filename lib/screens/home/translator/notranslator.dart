import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:translation/screens/main_screen/home.dart';

class NoTransFound_screen extends StatefulWidget {
  const NoTransFound_screen({super.key});

  @override
  State<NoTransFound_screen> createState() => _NoTransFound_screenState();
}

class _NoTransFound_screenState extends State<NoTransFound_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ));
                },
                child: Container(
                    padding: EdgeInsets.only(left: 30),
                    child: Icon(Icons.arrow_back)),
              ),
            ],
          ),
          SizedBox(
            height: 150,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/smiley.svg",
                  width: 145,
                  height: 145,
                ),
                SizedBox(height: 20),
                Text(
                  'No Translators Found',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
