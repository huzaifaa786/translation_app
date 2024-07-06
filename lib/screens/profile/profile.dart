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
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<ProfileController>(
            builder: (controller) => Builder(builder: (context) {
              return profileController.user != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Stack(children: [
                        Column(
                          children: [
                            TitleTopbar(
                              height: 0.15,
                              text: 'Profile'.tr,
                              ontap: () {
                                Navigator.pop(context);
                              },
                            ),
                            Container(
                              height: Get.height,
                              width: Get.width,
                              color: ggrey,
                            ),
                          ],
                        ),
                        Positioned(
                          top: 110,
                          left: 14,
                          right: 14,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 30, top: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: ggrey,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black, blurRadius: 6)
                                    ]),
                                child: Column(children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              height: 100,
                                              width: 100,
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                  // border: Border.all(
                                                  //   color: Colors.black,
                                                  // ),

                                                  // borderRadius: BorderRadius.all(
                                                  //     Radius.circular(70))
                                                  ),
                                              child: Stack(
                                                fit: StackFit.expand,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                55)),
                                                    child: profileController
                                                                .profileImage!
                                                                .path !=
                                                            ''
                                                        ? FittedBox(
                                                            fit: BoxFit
                                                                .scaleDown,
                                                            child: Image.file(
                                                              File(profileController
                                                                  .profileImage!
                                                                  .path),
                                                              height: 120,
                                                              width: 120,
                                                              fit: BoxFit.fill,
                                                            ),
                                                          )
                                                        : profileController
                                                                    .user ==
                                                                null
                                                            ? FittedBox(
                                                                fit: BoxFit
                                                                    .scaleDown,
                                                                child:
                                                                    Image.asset(
                                                                  "assets/images/5907.png",
                                                                  height: 120,
                                                                  width: 120,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              )
                                                            : profileController
                                                                        .user!
                                                                        .profilePic ==
                                                                    ''
                                                                ? FittedBox(
                                                                    fit: BoxFit
                                                                        .scaleDown,
                                                                    child: Image
                                                                        .asset(
                                                                      "assets/images/5907.png",
                                                                      height:
                                                                          120,
                                                                      width:
                                                                          120,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  )
                                                                : FittedBox(
                                                                    fit: BoxFit
                                                                        .scaleDown,
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      imageUrl: profileController
                                                                          .user!
                                                                          .profilePic!,
                                                                      height:
                                                                          120,
                                                                      width:
                                                                          120,
                                                                      fit: BoxFit
                                                                          .cover,
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
                                                    profileController
                                                        .selectProfileImage();
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
                                        ),

                                        // profileController.profileImage!.path == ''
                                        //     ? Container()
                                        //     : Text(profileController.profileImage!.path),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Text(
                                          profileController.user == null
                                              ? ''
                                              : profileController
                                                  .user!.username!,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Poppins'),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ]),
                                  StackInputField(
                                    hint: 'Enter your name',
                                    lable: 'Username'.tr,
                                    controller:
                                        profileController.nameController,
                                    validator: (user) =>
                                        Validators.emptyStringValidator(
                                            user, 'user'),
                                  ),
                                  StackInputField(
                                    readOnly: true,
                                    hint: 'Enter your Email',
                                    lable: 'Email Address'.tr,
                                    controller:
                                        profileController.emailController,
                                  ),
                                  profileController.user!.type == 'google'
                                      ? Container()
                                      : StackInputField(
                                          readOnly: true,
                                          hint: 'Enter your phone number',
                                          lable: 'Phone Number'.tr,
                                          controller:
                                              profileController.phoneController,
                                        ),
                                  profileController.user!.type == 'Email'
                                      ? ChangePassword(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ChangePassword_screen(),
                                                ));
                                          },
                                          title: 'Change Password'.tr,
                                        )
                                      : Container(),
                                  // profileController.user!.type == 'Email'
                                  // ?
                                  profileController.user!.type != 'Email'
                                      ? SizedBox(height: 25)
                                      : Container(),

                                  SizedBox(
                                    height: 49,
                                    width: 180,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          profileController.EditProfile(
                                              (success) {
                                            if (success) {
                                              update(context);
                                            }
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(35))),
                                        child: Text(
                                          'Update'.tr,
                                          style: TextStyle(
                                              color: white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600),
                                        )),
                                  )
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    )
                  : Container();
            }),
          ),
        ),
      )),
    );
  }

  update(context) {
    Alert(
      style: AlertStyle(
        titleStyle: TextStyle(fontSize: 25),
      ),
      context: context,
      title: "Successfully Updated".tr,
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
            "ok".tr,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: greenish,
        ),
      ],
    ).show();
  }
}
