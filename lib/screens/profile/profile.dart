import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:translation/screens/profile/changepassword.dart';
import 'package:translation/screens/profile/profilecontroller.dart';
import 'package:translation/static/largebutton.dart';
import 'package:translation/static/password.dart';
import 'package:translation/static/stack_input.dart';
import 'package:translation/static/titletopbar.dart';
import 'package:translation/values/controllers.dart';
import 'package:translation/values/validator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../values/colors.dart';

class Profile_screen extends StatefulWidget {
  const Profile_screen({super.key});

  @override
  State<Profile_screen> createState() => _Profile_screenState();
}

class _Profile_screenState extends State<Profile_screen> {
  fetchUser() async {
    await profileController.getuser();
    setState(() {});
  }

  @override
  void initState() {
    fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: GetBuilder<ProfileController>(
        builder: (controller) => Builder(builder: (context) {
          return Padding(
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
                  Stack(
                    children: [
                      Container(
                        height: 130,
                        width: 132,
                        padding: EdgeInsets.all(8),
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
                            ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(55),
                              ),
                              child: profileController.profileImage!.path != ''
                                  ? FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Image.file(
                                        File(profileController
                                            .profileImage!.path),
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  : profileController.user == null
                                      ? FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Image.asset(
                                            "assets/images/5907.jpg",
                                            height: 120,
                                            width: 120,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : profileController.user!.profilePic == ''
                                          ? FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Image.asset(
                                                "assets/images/5907.jpg",
                                                height: 120,
                                                width: 120,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          : FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: CachedNetworkImage(
                                                imageUrl: profileController
                                                    .user!.profilePic!,
                                                height: 120,
                                                width: 120,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: -25,
                          child: RawMaterialButton(
                            onPressed: () {
                              profileController.selectProfileImage();
                            },
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
                  )
                ],
              ),
              // profileController.profileImage!.path == ''
              //     ? Container()
              //     : Text(profileController.profileImage!.path),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Text(
                  profileController.user == null
                      ? ''
                      : profileController.user!.username!,
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
                controller: profileController.nameController,
                validator: (user) =>
                    Validators.emptyStringValidator(user, 'user'),
              ),
              StackInputField(
                readOnly: true,
                hint: 'Enter your Email',
                lable: 'Email Address',
                controller: profileController.emailController,
              ),
              StackInputField(
                readOnly: true,
                hint: 'Enter your phone number',
                lable: 'Phone Number',
                controller: profileController.phoneController,
              ),
              SizedBox(
                height: 10,
              ),
              ChangePassword(
                onPressed: () {
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
                  profileController.EditProfile((success) {
                    if (success) {
                      update(context);
                    }
                  });
                },
                title: 'Update',
                textcolor: white,
              ),
            ]),
          );
        }),
      ),
    ));
  }

  update(context) {
    Alert(
      style: AlertStyle(
        titleStyle: TextStyle(fontSize: 25),
      ),
      context: context,
      title: "Successfully Updated ",
      image: SvgPicture.asset(
        "assets/images/tick.svg",
        height: 90,
      ),
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
