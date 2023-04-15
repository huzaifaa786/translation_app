import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:translation/screens/profile/changepassword.dart';
import 'package:translation/screens/main_screen/home.dart';
import 'package:translation/static/button.dart';
import 'package:translation/static/largebutton.dart';
import 'package:translation/static/large_button.dart';
import 'package:translation/static/password.dart';
import 'package:translation/static/stack_input.dart';
import 'package:translation/static/titletopbar.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Column(children: [
            TitleTopbar(
              text: 'Profile',
              ontap: () {
                Navigator.pop(context);
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 130,
                  width: 132,
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(70),
                    ),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset("assets/images/profile.png"),
                      Positioned(
                          bottom: 0,
                          right: -25,
                          child: RawMaterialButton(
                            onPressed: () {},
                            elevation: 1.0,
                            fillColor: greenish,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: white,
                              size: 19,
                            ),
                            padding: EdgeInsets.all(5.0),
                            shape: CircleBorder(),
                          )),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: const Text(
                "William Jones",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Mazzard'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            StackInputField(
              hint: 'Enter your name',
              lable: 'Username',
            ),
            StackInputField(
              hint: 'Enter your Email',
              lable: 'Email Address',
            ),
            StackInputField(
              hint: 'Enter your phone number',
              lable: 'Phone Number',
            ),
            SizedBox(
              height: 10,
            ),
            ChangePassword(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangePassword_screen(),
                  ));
              },
              title: 'Change Password',
            ),
          
            LargeButtons(
              onPressed: () {
                update(context);
              },
              title: 'Update',
              textcolor: white,
            ),
          ]),
        ),
      ),
    );
  }

  update(context) {
    Alert(
      style: AlertStyle(
        titleStyle: TextStyle(fontSize: 25),
      ),
      context: context,
      title: "Successfully Updated ",
      image: SvgPicture.asset("assets/images/tick.svg", height: 90,),
      buttons: [
        DialogButton(
           radius: BorderRadius.all(
                  Radius.circular(12),
                ),
          height: 60,
          child: Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: greenish,
        ),
       
      ],
    ).show();
  }
}
