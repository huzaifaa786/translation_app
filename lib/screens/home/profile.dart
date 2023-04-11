import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:translation/screens/home/changepassword.dart';
import 'package:translation/screens/main_screen/home.dart';
import 'package:translation/static/large_button.dart';

import '../../../values/colors.dart';

class Profile_screen extends StatefulWidget {
  const Profile_screen({super.key});

  @override
  State<Profile_screen> createState() => _Profile_screenState();
}

class _Profile_screenState extends State<Profile_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
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
                  width: 90,
                ),
                Text(
                  "Profile",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
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
              "William Jones",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey,
                border: OutlineInputBorder(),
                hoverColor: Colors.grey,
                focusColor: Colors.grey,
                labelText: 'Username',
                hintText: 'hint',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey,
                border: OutlineInputBorder(),
                hoverColor: Colors.grey,
                focusColor: Colors.grey,
                labelText: 'Email Address',
                hintText: 'hint',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey,
                border: OutlineInputBorder(),
                hoverColor: Colors.grey,
                focusColor: Colors.grey,
                labelText: 'Phone Number',
                hintText: 'hint',
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Text(
                "Change Password",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                width: 155,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePassword_screen()));
                },
                child: SvgPicture.asset(
                  "assets/icons/forward.svg", // replace with your logo asset path
                  height: 29,
                  width: 29,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
                child: LargeButton(
              title: 'Update',
              sreenRatio: 0.8,
              onPressed: () {
                setState(() {});
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
                            Center(
                              child: SvgPicture.asset(
                                "assets/images/tick.svg", // replace with your logo asset path
                                height: 120,
                                width: 120,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: Text(
                                "Successfully Updated",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK'),
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
                // authController.signIn();
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => Notification_screen(),
                //     ));
              },
              color: greenish,
              textcolor: Colors.white,
              buttonWidth: 0.95,
            )),
          ),
        ]),
      ),
    );
  }
}
