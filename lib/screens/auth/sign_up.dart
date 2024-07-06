// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translation/screens/auth/authcontroller.dart';
import 'package:translation/screens/main_screen/home.dart';
import 'package:translation/static/main_button.dart';
import 'package:translation/static/password_input.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/static/input_field1.dart';
import 'package:translation/static/large_button.dart';
import 'package:translation/values/controllers.dart';
import 'package:translation/values/validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscureText = true;
  bool _obscureText1 = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggle1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ggrey,
      body: SafeArea(
        
        child: GetBuilder<AuthController>(
            builder: (controller) => SingleChildScrollView(
                  child: Stack(
                    children: [
                      // Image.asset(
                      //   "assets/images/loginback.jpg",
                      //   height: MediaQuery.of(context).size.height * 0.25,
                      //   width: double.infinity,
                      // ),
                      Container(
                        height: Get.height * 0.3,
                        width: Get.width,
                        decoration: BoxDecoration(
                          gradient: greenishgradient,
                        ),
                      ),
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                            child: Center(
                              child: Image(
                                image:
                                    AssetImage("assets/images/splashLogo.png"),
                                height: 140,
                                color: white,
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              height: MediaQuery.of(context).size.height * 0.72,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: ggrey,
                                  ),
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
                                            fontSize: 25,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            color: greenish),
                                      ),
                                    ),
                                    InputField1(
                                      hint: 'Username',
                                      icon: 'assets/images/user-circle.svg',
                                      controller: authController.userName,
                                      validator: (user) =>
                                          Validators.emptyStringValidator(
                                              user, 'UserName'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 4, top: 4),
                                      child: InputField1(
                                        icon: 'assets/images/email1.svg',
                                        hint: 'Email Address',
                                        controller: authController.email,
                                        validator: (user) =>
                                            Validators.emptyStringValidator(
                                                user, 'email'),
                                        type: TextInputType.emailAddress,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: InputField1(
                                        hint: 'Phone Number',
                                        icon: 'assets/images/call.svg',
                                        controller: authController.phone,
                                        validator: (user) =>
                                            Validators.emptyStringValidator(
                                                user, 'Number'),
                                        type: TextInputType.number,
                                      ),
                                    ),
                                    // InputField1(
                                    //   hint: 'Password',
                                    //   icon: 'assets/images/lock.svg',
                                    //   obscure: true,
                                    //   controller: authController.password,
                                    //   validator: (password) =>
                                    //       Validators.passwordValidator(password),
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(
                                    //       top: 4, bottom: 20),
                                    //   child: InputField1(
                                    //     hint: 'Confirm Password',
                                    //     icon: 'assets/images/lock.svg',
                                    //     obscure: true,
                                    //     controller:
                                    //         authController.confirmPassword,
                                    //     validator: (password) =>
                                    //         Validators.passwordValidator(
                                    //             password),
                                    //   ),
                                    // ),
                                    InputFieldPassword1(
                                      controller: authController.password,
                                      imageIcon: 'assets/images/lock 01.svg',
                                      hint: 'Password',
                                      borderColor: Colors.black,
                                      imageColor: Colors.black,
                                      toggle: _toggle,
                                      obscure: _obscureText,
                                      validate:
                                          authController.validateSignUpForm,
                                      validator: (password) =>
                                          Validators.passwordValidator(
                                              password),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 4, bottom: 20),
                                      child: InputFieldPassword1(
                                        controller:
                                            authController.confirmPassword,
                                        imageIcon: 'assets/images/lock 01.svg',
                                        hint: 'Confirm Password',
                                        borderColor: Colors.black,
                                        imageColor: Colors.black,
                                        toggle: _toggle1,
                                        obscure: _obscureText1,
                                        validate:
                                            authController.validateSignUpForm,
                                        validator: (password) =>
                                            Validators.passwordValidator(
                                                password),
                                      ),
                                    ),
                                    MainButton(
                                      title: 'Sign Up',
                                      sreenRatio: 0.4,
                                      onPressed: () {
                                        authController.SignUp((success) {
                                          if (success) {
                                            authController
                                                .ClearSignupVariables();
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
                                      btnhight: 49.0,
                                    ),
                                    // LargeButton(
                                    //   title: 'Sign Up',
                                    //   sreenRatio: 0.9,
                                    //   onPressed: () {
                                    //     authController.SignUp((success) {
                                    //       if (success) {
                                    //         authController
                                    //             .ClearSignupVariables();
                                    //         authController.validateSignUpForm =
                                    //             false.obs;
                                    //         Get.offAll(() => Home_screen());
                                    //       }
                                    //     });
                                    //     setState(() {});
                                    //   },
                                    //   color: greenish,
                                    //   textcolor: Colors.white,
                                    //   buttonWidth: 0.95,
                                    // ),
                                  ]),
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                )),
      ),
    );
  }
}
