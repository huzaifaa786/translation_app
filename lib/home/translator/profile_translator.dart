import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:translation/static/large_button.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/screens/home/checkout.dart';
import 'package:translation/screens/translator_screens/translator_screen.dart';

class profile_translator extends StatefulWidget {
  const profile_translator({super.key});

  @override
  State<profile_translator> createState() => _profile_translatorState();
}

class _profile_translatorState extends State<profile_translator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                                builder: (context) => Translator_()));
                      },
                      child: SvgPicture.asset("assets/icons/back.svg")),
                  SizedBox(
                    width: 120,
                  ),
                  Text(
                    "Detail",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                  ),
                  SizedBox(
                    width: 120,
                  ),
                  SvgPicture.asset("assets/images/heart.svg"),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              width: 98,
              height: 98,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Color(0xFF34607B)),
                borderRadius: BorderRadius.circular(70),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: SvgPicture.asset(
                  "assets/images/splash_3.svg",
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: const Text(
                "Watson",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Row(
                children: [
                  SizedBox(
                    width: 190,
                  ),
                  Icon(Icons.star, color: Colors.yellow, size: 11),
                  SizedBox(width: 5),
                  Text('5.0',
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    "Language",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(15, 15, 0, 15),
                  width: 89,
                  height: 36.6,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Color.fromRGBO(0, 0, 0, 0.24), width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Arabic',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 15, 0, 15),
                  width: 89,
                  height: 36.6,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Color.fromRGBO(0, 0, 0, 0.24), width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Arabic',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 15, 0, 15),
                  width: 89,
                  height: 36.6,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Color.fromRGBO(0, 0, 0, 0.24), width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Arabic',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 0, 15),
                  width: 89,
                  height: 36.6,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Color.fromRGBO(0, 0, 0, 0.24), width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Arabic',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 0, 15),
                  width: 89,
                  height: 36.6,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Color.fromRGBO(0, 0, 0, 0.24), width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Arabic',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    "Certificates",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Image.asset("assets/icons/free.png"),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "lorem ipsum dolor sit",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    "About",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae amet placerat dignissim nibh dictum sit. Pretium ornare viverra.,",
                style: TextStyle(fontSize: 14),
              ),
            ),
            Container(
              width: 345,
              height: 48,
              margin: EdgeInsets.only(
                left: 18,
                top: 10,
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 69, 59, 59).withOpacity(0.5),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/audio.svg"),
                  Text("Audio Now"),
                  SizedBox(
                    width: 20,
                  ),
                  Text("/"),
                  SvgPicture.asset("assets/icons/audio.svg"),
                  Text("Video Now"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Row(
                children: [
                  Text(
                    "How many hours do you need translator",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(9),
                    width: 125,
                    height: 43,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: Color.fromRGBO(0, 0, 0, 0.24), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '00:30 mins',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(9),
                    width: 125,
                    height: 43,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: Color.fromRGBO(0, 0, 0, 0.24), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '00:30 mins',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(9),
                    width: 125,
                    height: 43,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: Color.fromRGBO(0, 0, 0, 0.24), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '00:30 mins',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  width: 125,
                  height: 43,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Color.fromRGBO(0, 0, 0, 0.24), width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Schedule',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Radio(
                        value: 2,
                        groupValue: 0,
                        onChanged: (value) {
                          setState(() {
                            // _site = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ListTile(
              title: const Text('Audio/Video'),
              leading: Radio(
                value: 1,
                groupValue: 0,
                onChanged: (value) {
                  setState(() {
                    // _site = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('In Person'),
              leading: Radio(
                autofocus: true,
                activeColor: Colors.blue,
                focusColor: Colors.blue,
                value: 2,
                groupValue: 0,
                onChanged: (value) {
                  setState(() {
                    // _site = value;
                  });
                },
              ),
            ),
            Row(
              children: [
                Container(
                  child: Column(children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Tue",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("08", style: TextStyle(fontSize: 16))
                  ]),
                  width: 54,
                  height: 85,
                  margin: EdgeInsets.only(
                    left: 30,
                    top: 13,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Container(
                  child: Column(children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Tue",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("08", style: TextStyle(fontSize: 16))
                  ]),
                  width: 54,
                  height: 85,
                  margin: EdgeInsets.only(
                    left: 10,
                    top: 13,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Container(
                  child: Column(children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Tue",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("08", style: TextStyle(fontSize: 16))
                  ]),
                  width: 54,
                  height: 85,
                  margin: EdgeInsets.only(
                    left: 10,
                    top: 13,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Container(
                  child: Column(children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Tue",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("08", style: TextStyle(fontSize: 16))
                  ]),
                  width: 54,
                  height: 85,
                  margin: EdgeInsets.only(
                    left: 10,
                    top: 13,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Container(
                  child: Column(children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Tue",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("08", style: TextStyle(fontSize: 16))
                  ]),
                  width: 54,
                  height: 85,
                  margin: EdgeInsets.only(
                    left: 10,
                    top: 13,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Container(
                  child: Column(children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Tue",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("08", style: TextStyle(fontSize: 16))
                  ]),
                  width: 54,
                  height: 85,
                  margin: EdgeInsets.only(
                    left: 10,
                    top: 13,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                  child: Row(
                    children: [
                      Text(
                        "Set Time",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(9),
                    width: 125,
                    height: 43,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: Color.fromRGBO(0, 0, 0, 0.24), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '00:30 ',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("To"),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    margin: EdgeInsets.all(9),
                    width: 125,
                    height: 43,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: Color.fromRGBO(0, 0, 0, 0.24), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '00:30 ',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  width: 187,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Color.fromRGBO(0, 0, 0, 0.24), width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Document Type',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Radio(
                        value: 2,
                        groupValue: 0,
                        onChanged: (value) {
                          setState(() {
                            // _site = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ListTile(
              title: const Text('Urgent Document'),
              leading: Radio(
                value: 1,
                groupValue: 0,
                onChanged: (value) {
                  setState(() {
                    // _site = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Not Urgent Document'),
              leading: Radio(
                autofocus: true,
                activeColor: Colors.blue,
                focusColor: Colors.blue,
                value: 2,
                groupValue: 0,
                onChanged: (value) {
                  setState(() {
                    // _site = value;
                  });
                },
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Container(
                          height: 50,
                          width: 50,
                          child: Image.asset("assets/icons/free.png")),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Document",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "RS 50",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Container(
                          height: 50,
                          width: 50,
                          child: Image.asset("assets/icons/free.png")),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Attach File",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Row(
                children: [
                  Text(
                    "How many pages in a doc",
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Container(
                    child: Center(
                        child: Text(
                      "-",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("0"),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Center(
                        child: Text(
                      "+",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )),
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      color: greenish,
                      border: Border.all(
                        width: 1,
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text(
                    "Will deliver in: 3 days",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  width: 366,
                  height: 115,
                  margin: EdgeInsets.only(
                    left: 20,
                    top: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Color.fromRGBO(0, 0, 0, 0.17),
                    ),
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 45,
            ),
            LargeButton(
              title: 'Checkout',
              sreenRatio: 0.9,
              onPressed: () {
                setState(() {});
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Checkout_screen()));
                // authController.signIn();
                // Navigator.pushNamed(context, 'home');
              },
              color: greenish,
              textcolor: Colors.white,
              buttonWidth: 0.95,
            )
          ],
        ),
      ),
    );
  }
}

/////////////Interpretation not found
//  showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         contentPadding: EdgeInsets.zero,
//                         content: Container(
//                           width: 313,
//                           height: 275,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Colors.white,
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.stretch,
//                             children: [
//                               Container(
//                                 height: 80,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.vertical(
//                                       top: Radius.circular(10)),
//                                 ),
//                                 child: Center(
//                                   child: SvgPicture.asset(
//                                     "assets/images/group.svg", // replace with your logo image path
//                                     width: 60,
//                                     height: 60,
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 16),
//                                 child: Text(
//                                   'Sorry! Interpreter not within your range.',
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Align(
//                                   alignment: Alignment.bottomCenter,
//                                   child: ElevatedButton(
//                                     onPressed: () {
//                                       Navigator.pop(context);
//                                     },
//                                     child: Text('OK'),
//                                     style: ButtonStyle(
//                                       backgroundColor:
//                                           MaterialStateProperty.all<Color>(
//                                               greenish),
//                                       fixedSize: MaterialStateProperty.all(
//                                           Size(248, 64)),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );


//////Sorry Session Booked
///  showDialog(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return AlertDialog(
                  //       title: Center(
                  //         child: SvgPicture.asset(
                  //           "assets/images/group.svg", // replace with your logo image path
                  //           width: 60,
                  //           height: 60,
                  //         ),
                  //       ),
                  //       content: Container(
                  //         width: 215,
                  //         height: 78,
                  //         child: Center(
                  //           child: Text(
                  //             'Sorry! Session is booked, please try other available timings.',
                  //             textAlign: TextAlign.center,
                  //             style: TextStyle(
                  //               fontFamily: 'Nunito Sans',
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 19,
                  //               color: Color.fromRGBO(0, 0, 0, 0.63),
                  //               height: 1.37,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       actions: [
                  //         TextButton(
                  //           onPressed: () {
                  //             Navigator.pop(context);
                  //           },
                  //           child: Expanded(
                  //             child: Align(
                  //               alignment: Alignment.bottomCenter,
                  //               child: ElevatedButton(
                  //                 onPressed: () {
                  //                   Navigator.pop(context);
                  //                 },
                  //                 child: Text('OK'),
                  //                 style: ButtonStyle(
                  //                   backgroundColor:
                  //                       MaterialStateProperty.all<Color>(
                  //                           greenish),
                  //                   fixedSize: MaterialStateProperty.all(
                  //                       Size(248, 64)),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     );
                  //   },
                  // );
