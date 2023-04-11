import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:translation/screens/main_screen/home.dart';
import 'package:translation/static/large_button.dart';

import '../../../../values/colors.dart';

class ChangePassword_screen extends StatefulWidget {
  const ChangePassword_screen({super.key});

  @override
  State<ChangePassword_screen> createState() => _ChangePassword_screenState();
}

class _ChangePassword_screenState extends State<ChangePassword_screen> {
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
                  width: 80,
                ),
                Text(
                  "Change Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
              ],
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
                labelText: 'Current Password',
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
                labelText: 'New Password',
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
                labelText: 'Confirm Password',
                hintText: 'hint',
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
                child: LargeButton(
              title: 'Change',
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
