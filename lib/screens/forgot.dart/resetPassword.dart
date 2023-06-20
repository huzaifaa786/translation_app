// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translation/screens/forgot.dart/emailOtp.dart';
import 'package:translation/screens/auth/authcontroller.dart';
import 'package:translation/screens/auth/login_screen.dart';
import 'package:translation/screens/main_screen/home.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/static/input_field1.dart';
import 'package:translation/static/large_button.dart';
import 'package:translation/values/controllers.dart';
import 'package:translation/values/validator.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<AuthController>(
            builder: (controller) => Stack(
                  children: [
                    Image.asset(
                      "assets/images/loginback.png",
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: double.infinity,
                    ),
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                          child: Center(
                            child: Image(
                              image: AssetImage("assets/images/splashLogo.png"),
                              height: 100,
                              color: white,
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            height: MediaQuery.of(context).size.height * 0.72,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 250, 250, 250),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    topLeft: Radius.circular(30))),
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: Column(children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    padding: const EdgeInsets.only(
                                        top: 30, bottom: 20),
                                    child: Text(
                                      'Reset Your Account Password.',
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          color: greenish),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    child: InputField1(
                                      hint: 'Enter New Password',
                                      icon: 'assets/images/lock.svg',
                                      controller: authController.resetPassword,
                                      obscure: true,
                                      validate:
                                          authController.validateForgotForm,
                                      validator: (value) {
                                        print(value.length);
                                        if (value.length < 6) {
                                          return 'Password cannot be empty';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  LargeButton(
                                    title: 'RESET',
                                    sreenRatio: 0.9,
                                    onPressed: () {
                                      setState(() {});
                                      controller.ResetPassword((success) {
                                        if (success) {
                                          Get.snackbar(
                                              'Password changed successfully!',
                                              'Your password has been updated and you can now log in to your account using your new credentials.',
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                              backgroundColor: greenish,
                                              colorText: Colors.white);
                                          Get.offAll(() => LoginScreen());
                                        }
                                      });
                                    },
                                    color: greenish,
                                    textcolor: Colors.white,
                                    buttonWidth: 0.95,
                                  ),
                                ]),
                              ),
                            ))
                      ],
                    ),
                  ],
                )),
      ),
    );
  }
}
