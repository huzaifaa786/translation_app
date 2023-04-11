import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:translation/screens/home/enteramount.dart';
import 'package:translation/screens/company_login/company_login_screen.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/screens/main_screen/home.dart';
import 'package:translation/screens/home/profile.dart';

class Setting_screen extends StatefulWidget {
  const Setting_screen({super.key});

  @override
  State<Setting_screen> createState() => _Setting_screenState();
}

class _Setting_screenState extends State<Setting_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            // SizedBox(
            //   height: 40,
            // ),
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
                    "Setting",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  width: 300,
                  height: 136,
                  margin: EdgeInsets.only(
                    left: 36,
                    top: 15,
                  ),
                  decoration: BoxDecoration(
                    color: greenish,
                    border: Border.all(
                      width: 1,
                      color: Color.fromRGBO(0, 0, 0, 0.17),
                    ),
                    borderRadius: BorderRadius.circular(19),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 8, 8, 5),
                                child: Text(
                                  "Your Balance",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  "AED 129.99",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  "William Jones",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: 90,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 85,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  child: Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Add your button's onPressed function here
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Topup_screen()),
                                        );
                                      },
                                      child: Text(
                                        'Top Up',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(78, 26),
                                        padding: EdgeInsets.zero,
                                        primary: Colors
                                            .white, // Button background color
                                        onPrimary: greenish, // Button text color
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              8.0), // Button border radius
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile_screen()),
                );
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 43,
                    height: 43,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 199, 193, 193),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/icons/profile.svg", // replace with your logo asset path
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  SizedBox(
                    width: 180,
                  ),
                  SvgPicture.asset(
                    "assets/icons/forward.svg", // replace with your logo asset path
                    height: 30,
                    width: 30,
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
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 43,
                  height: 43,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 199, 193, 193),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/icons/msgss.svg", // replace with your logo asset path
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Language",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                SizedBox(
                  width: 155,
                ),
                Text(
                  "AR",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                )
              ],
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
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 43,
                  height: 43,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 199, 193, 193),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/icons/warning.svg", // replace with your logo asset path
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Report bug/issues",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                SizedBox(
                  width: 90,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          content: Container(
                            width: 313,
                            height: 275,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: 43,
                                  height: 43,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 199, 193, 193),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/icons/warning.svg", // replace with your logo asset path
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Text(
                                    'Sorry! Interpreter not within your range.',
                                    style: TextStyle(fontSize: 11),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 270,
                                      height: 100,
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
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(""),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Send'),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                greenish),
                                        fixedSize: MaterialStateProperty.all(
                                            Size(248, 64)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: SvgPicture.asset(
                    "assets/icons/forward.svg", // replace with your logo asset path
                    height: 30,
                    width: 30,
                  ),
                ),
              ],
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
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 43,
                  height: 43,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 199, 193, 193),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/icons/unprofile.svg", // replace with your logo asset path
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Vendor Access",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                SizedBox(
                  width: 115,
                ),
                SvgPicture.asset(
                  "assets/icons/forward.svg", // replace with your logo asset path
                  height: 30,
                  width: 30,
                ),
              ],
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
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginCompanyScreen()),
                );
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 43,
                    height: 43,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 199, 193, 193),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/icons/home.svg", // replace with your logo asset path
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Company Access",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  SizedBox(
                    width: 95,
                  ),
                  SvgPicture.asset(
                    "assets/icons/forward.svg", // replace with your logo asset path
                    height: 30,
                    width: 30,
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              height: 1,
              endIndent: 40,
              indent: 40,
              color: Color.fromARGB(255, 192, 180, 180),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      contentPadding: EdgeInsets.zero,
                      content: Container(
                        width: 313,
                        height: 275,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 280.0),
                              child: SvgPicture.asset(
                                "assets/icons/cross.svg", // replace with your logo asset path
                                height: 20,
                                width: 20,
                              ),
                            ),
                            Center(
                              child: SvgPicture.asset(
                                "assets/icons/exclaim.svg", // replace with your logo asset path
                                height: 20,
                                width: 20,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 20, 25, 10),
                              child: Text(
                                'Are you sure you want to log out?',
                                style: TextStyle(fontSize: 21),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Yes'),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                greenish),
                                        fixedSize: MaterialStateProperty.all(
                                            Size(123, 49)),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('No'),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.black),
                                        fixedSize: MaterialStateProperty.all(
                                            Size(123, 49)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 150,
                  ),
                  Text(
                    "Log Out",
                    style: TextStyle(color: Colors.red, fontSize: 17),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(
                    "assets/icons/arrow.svg", // replace with your logo asset path
                    height: 20,
                    width: 27,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }
}
