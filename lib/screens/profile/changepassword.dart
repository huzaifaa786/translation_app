import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:translation/screens/profile/profilecontroller.dart';
import 'package:translation/static/large_button.dart';
import 'package:translation/static/password_field.dart';
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
              PasswordInputField(
                hint: 'Enter Current Password',
                lable: 'Current Password',
                controller: profileController.currentpasswordController,
                toggle: controller.toggle,
                obscure: controller.obscureTextPassword,
              ),
              PasswordInputField(
                hint: 'Enter New Password',
                lable: 'New Password',
                controller: profileController.newpasswordController,
                toggle: controller.toggle1,
                obscure: controller.obscureTextPassword1,
              ),
              PasswordInputField(
                hint: 'Enter Confirm Password',
                lable: 'Confirm Password',
                controller: profileController.confirmpasswordController,
                toggle: controller.toggle2,
                obscure: controller.obscureTextPassword2,
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: Get.height * 0.06,
                width: Get.width * 0.4,
                child: LargeButton(
                    radius: 30.0,
                    color: greenish,
                    title: 'Update',
                    onPressed: () {
                      profileController.changepassword((success) {
                        if (success) {
                          update(context);
                        }
                      });
                    }),
              )
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
      title: "",
      content: Column(
        children: [
          Text(
            "Successfully\n Updated",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w700, color: greenish),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10), // Adds space between the text and the image
          Image.asset(
            "assets/images/Ok.png",
            height: 90,
          ),
        ],
      ),
      buttons: [
        DialogButton(
          radius: BorderRadius.all(
            Radius.circular(19),
          ),
          height: 34,
          width: MediaQuery.of(context).size.width * 0.4,
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
