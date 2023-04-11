import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:translation/screens/main_screen/home.dart';

class FreeItem_screen extends StatefulWidget {
  const FreeItem_screen({super.key});

  @override
  State<FreeItem_screen> createState() => _FreeItem_screenState();
}

class _FreeItem_screenState extends State<FreeItem_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: SvgPicture.asset("assets/icons/back.svg")),
                SizedBox(
                  width: 80,
                ),
                Text(
                  "Free Item",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Text(
                "English",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 80,
              ),
              Center(
                child: SvgPicture.asset(
                  "assets/images/arrows.svg", // replace with your logo asset path
                  height: 38,
                  width: 38,
                ),
              ),
              SizedBox(
                width: 70,
              ),
              Text(
                "Hindi",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Container(
                width: 290,
                height: 86,
                margin: EdgeInsets.only(
                  left: 36,
                  top: 8,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color.fromRGBO(0, 0, 0, 0.17),
                  ),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("How are you"),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Container(
                width: 290,
                height: 86,
                margin: EdgeInsets.only(
                  left: 36,
                  top: 8,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color.fromRGBO(0, 0, 0, 0.17),
                  ),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Kesy ho"),
                ),
              ),
            ],
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
    );
  }
}
