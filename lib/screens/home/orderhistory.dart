import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:translation/screens/main_screen/home.dart';

class OrdrerHistory_screen extends StatefulWidget {
  const OrdrerHistory_screen({super.key});

  @override
  State<OrdrerHistory_screen> createState() => _OrdrerHistory_screenState();
}

class _OrdrerHistory_screenState extends State<OrdrerHistory_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(children: [
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
                width: 100,
              ),
              Text(
                "History",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              margin: EdgeInsets.all(8),
                              width: 72,
                              height: 72,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: Color(0xFF34607B)),
                                borderRadius: BorderRadius.circular(70),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(70),
                                child: SvgPicture.asset(
                                  "assets/images/splash_3.svg",
                                  width: 74,
                                  height: 74,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 73.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Order No# 495-909334",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "AED 50",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 68.0),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 18.0),
                                            child: Text(
                                              "Thomas willain",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          Text(
                                            "Urgent Document",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 55,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //       builder: (context) =>
                                          //           attendant_report_screen()),
                                          // );
                                        },
                                        child: Container(
                                          width: 78,
                                          height: 26,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF34607B),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "In progress",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 78.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.lock_clock),
                                      Text(
                                        "08:00-16:00 | 03.12.2022 ",
                                        style: TextStyle(fontSize: 11),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "View Document",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 9),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 118.0),
                                  child: SvgPicture.asset(
                                    "assets/icons/msg.svg", // replace with your logo asset path
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 1,
                        height: 1,
                        endIndent: 40,
                        indent: 40,
                        color: Color.fromARGB(255, 192, 180, 180),
                      ),
                    ],
                  )),
        ),
      ]),
    );
  }
}
