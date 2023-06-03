import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:translation/screens/main_screen/home.dart';
import 'package:translation/screens/profile/profilecontroller.dart';
import 'package:translation/static/large_button.dart';
import 'package:translation/static/stack_input.dart';
import 'package:translation/static/titletopbar.dart';
import 'package:translation/values/controllers.dart';

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
      body: SafeArea(
        child: GetBuilder<ProfileController>(
          builder: (controller) => SingleChildScrollView(
            child: Column(children: [
              TitleTopbar(
                text: 'Change Password',
                ontap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 30,
              ),
              StackInputField(
                hint: 'Enter Current Password',
                lable: 'Current Password',
                controller: profileController.currentpasswordController,
                obscure: true,
              ),
              StackInputField(
                hint: 'Enter New Password',
                lable: 'New Password',
                controller: profileController.newpasswordController,
                obscure: true,
              ),
              StackInputField(
                hint: 'Enter Confirm Password',
                lable: 'Confirm Password',
                controller: profileController.confirmpasswordController,
                obscure: true,
              ),
              SizedBox(
                height: 40,
              ),
              LargeButton(
                  color: greenish,
                  title: 'Change',
                  onPressed: () {
                    profileController.changepassword((success) {
                      if (success) {
                        update(context);
                      }
                    });
                  })
            ]),
          ),
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
          onPressed: () {
            Get.back();
          },
          color: greenish,
        ),
      ],
    ).show();
  }
}
