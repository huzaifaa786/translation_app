// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translation/screens/auth/authcontroller.dart';
import 'package:translation/screens/main_screen/home.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/static/input_field1.dart';
import 'package:translation/static/large_button.dart';
import 'package:translation/values/controllers.dart';
import 'package:translation/values/validator.dart';

class OtpRegisterScreen extends StatefulWidget {
  const OtpRegisterScreen({super.key});

  @override
  State<OtpRegisterScreen> createState() => _OtpRegisterScreenState();
}

class _OtpRegisterScreenState extends State<OtpRegisterScreen> {
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
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 30, bottom: 20),
                                    child: Text(
                                      'Register Account',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          color: greenish),
                                    ),
                                  ),
                                  InputField1(
                                    hint: 'Username',
                                    icon: 'assets/images/user.svg',
                                    controller: authController.userName,
                                    validator: (user) =>
                                        Validators.emptyStringValidator(
                                            user, 'UserName'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 4, top: 4),
                                    child: InputField1(
                                      icon: 'assets/images/email.svg',
                                      hint: 'Email Address',
                                      controller: authController.email,
                                      validator: (user) =>
                                          Validators.emptyStringValidator(
                                              user, 'email'),
                                      type: TextInputType.emailAddress,
                                    ),
                                  ),
                                  LargeButton(
                                    title: 'Sign Up',
                                    sreenRatio: 0.9,
                                    onPressed: () {
                                      authController.OtpSignUp((success) {
                                        if (success) {
                                          authController.ClearSignupVariables();
                                          authController.validateSignUpForm =
                                              false.obs;
                                          Get.offAll(() => Home_screen());
                                        }
                                      });
                                      setState(() {});
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
