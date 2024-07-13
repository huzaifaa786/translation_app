// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:translation/screens/auth/otp_verify/loginOtp.dart';
import 'package:translation/screens/company_login/company_login_screen.dart';
import 'package:translation/screens/forgot.dart/forgotAccount.dart';
import 'package:translation/screens/auth/authcontroller.dart';
import 'package:translation/screens/main_screen/home.dart';
import 'package:translation/screens/auth/sign_up.dart';
import 'package:translation/static/company_access_card.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/static/input_field1.dart';
import 'package:translation/static/large_button.dart';
import 'package:translation/values/controllers.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int index = 0;

  getindex(int id) async {
    setState(() {
      index = id;
      authController.clear();
    });
  }

  bool isToggled = false;
  bool isEmailSelected = true;

  void _toggleButton() {
    setState(() {
      isEmailSelected = !isEmailSelected;
      if (!isEmailSelected) {
        index = 1;
      } else {
        index = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GetBuilder<AuthController>(
            builder: (controller) => Stack(
                  children: [
                    Image.asset(
                      "assets/images/loginback.jpg",
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: double.infinity,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                          child: Center(
                            child: Image.asset(
                              "assets/images/splashLogo.png",
                              height: 100,
                              color: white,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 250, 250, 250),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            children: [
                              // Padding(
                              //   padding: const EdgeInsets.symmetric(vertical: 15),
                              //   child: GestureDetector(
                              //     onTap: _toggleButton,
                              //     child: Container(
                              //       width: 200,
                              //       height: 50,
                              //       decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.circular(25),
                              //         color: Colors.white,
                              //       ),
                              //       child: Stack(
                              //         children: [
                              //           AnimatedPositioned(
                              //             duration: Duration(milliseconds: 200),
                              //             left: isEmailSelected ? 0 : 100,
                              //             child: Container(
                              //               width: 100,
                              //               height: 50,
                              //               decoration: BoxDecoration(
                              //                 borderRadius:
                              //                     BorderRadius.circular(25),
                              //                 color: greenish,
                              //               ),
                              //               alignment: Alignment.center,
                              //               child: Text(
                              //                 isEmailSelected ? 'Email' : 'OTP',
                              //                 style: TextStyle(
                              //                   color: Colors.white,
                              //                   fontWeight: FontWeight.bold,
                              //                 ),
                              //               ),
                              //             ),
                              //           ),
                              //           Container(
                              //             width: 100,
                              //             child: Align(
                              //               alignment: Alignment.center,
                              //               child: Text(
                              //                 'Email',
                              //                 style: TextStyle(
                              //                   color: isEmailSelected
                              //                       ? Colors.transparent
                              //                       : Colors.black,
                              //                   fontWeight: FontWeight.bold,
                              //                 ),
                              //               ),
                              //             ),
                              //           ),
                              //           Positioned(
                              //             right: 0,
                              //             top: 16,
                              //             child: Container(
                              //               width: 100,
                              //               child: Align(
                              //                 alignment: Alignment.center,
                              //                 child: Text(
                              //                   'OTP',
                              //                   style: TextStyle(
                              //                     color: isEmailSelected
                              //                         ? Colors.black
                              //                         : Colors.transparent,
                              //                     fontWeight: FontWeight.bold,
                              //                   ),
                              //                 ),
                              //               ),
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              index == 0
                                  ? Container(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 20),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.69,
                                      child: SingleChildScrollView(
                                        child: Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 14, bottom: 20),
                                                child: Text(
                                                  'WELCOME BACK',
                                                  style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: greenish),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 4, top: 9),
                                                child: InputField1(
                                                  icon:
                                                      'assets/images/email.svg',
                                                  hint: 'Email Address',
                                                  controller:
                                                      authController.email,
                                                ),
                                              ),
                                              InputField1(
                                                icon: 'assets/images/lock.svg',
                                                hint: 'Password',
                                                obscure: true,
                                                controller:
                                                    authController.password,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 12, bottom: 16),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Get.to(() =>
                                                            ForgotScreen());
                                                      },
                                                      child: Text(
                                                        "Forgot Password?",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Colors.black54,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              LargeButton(
                                                title: 'Login',
                                                sreenRatio: 0.9,
                                                onPressed: () {
                                                  setState(() {});
                                                  authController.SignIn(
                                                      (success) {
                                                    if (success) {
                                                      authController
                                                              .validateSignUpForm =
                                                          false.obs;
                                                      Get.offAll(
                                                          () => Home_screen());
                                                    }
                                                  });
                                                },
                                                color: greenish,
                                                textcolor: Colors.white,
                                                buttonWidth: 0.95,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 40, bottom: 25),
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'New User ? ',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 15),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  RegisterScreen(),
                                                            ),
                                                          );
                                                        },
                                                        child: Text(
                                                          'Register Now',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: greenish,
                                                              fontSize: 15),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Divider(
                                                      color: Colors.grey,
                                                      height: 1,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10),
                                                    child: Text(
                                                      'Or login with',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 18,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Divider(
                                                      color: Colors.grey,
                                                      height: 1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 20, bottom: 20),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        authController
                                                            .signInwithGoogle();
                                                      },
                                                      child: Image.asset(
                                                        "assets/images/google.png",
                                                        height: 34,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 20),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.65,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 30, bottom: 30),
                                              child: Text(
                                                'WELCOME BACK',
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w600,
                                                    color: greenish),
                                              ),
                                            ),
                                            Container(
                                              height: 100,
                                              child: IntlPhoneField(
                                                style: TextStyle(fontSize: 14),
                                                controller:
                                                    authController.phone,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          bottom: 0.5),
                                                  hintStyle:
                                                      TextStyle(fontSize: 12),
                                                  filled: true,
                                                  fillColor: white,
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(),
                                                    gapPadding: 50,
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: greenish),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: greenish),
                                                  ),
                                                ),
                                                initialCountryCode: 'AE',
                                                onChanged: (phone) {
                                                  authController
                                                          .completeNumber =
                                                      phone.completeNumber;
                                                  print(
                                                      'authController.completeNumber');
                                                  print(phone.completeNumber);
                                                  print(authController
                                                      .completeNumber);
                                                },
                                                keyboardType:
                                                    TextInputType.phone,
                                              ),
                                            ),
                                            LargeButton(
                                              title: 'Request OTP',
                                              sreenRatio: 0.9,
                                              onPressed: () {
                                                authController.getuser();
                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //       builder: (context) =>
                                                //           VerifyPhone(),
                                                //     ));
                                              },
                                              color: greenish,
                                              textcolor: Colors.white,
                                              buttonWidth: 0.95,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
      ),
    );
  }
}
