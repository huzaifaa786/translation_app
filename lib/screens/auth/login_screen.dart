// ignore_for_file: prefer_ _ ructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
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
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int index = 0;

  getindex(id) async {
    setState(() {
      index = id;
      authController.clear();
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
                            child: Image(
                              image: AssetImage("assets/images/splashLogo.png"),
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
                                  topLeft: Radius.circular(30))),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 16),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(40),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 3))
                                    ],
                                  ),
                                  child: ToggleSwitch(
                                    initialLabelIndex: index,
                                    labels: [
                                      'Email',
                                      'OTP',
                                    ],
                                    totalSwitches: 2,
                                    onToggle: (index) {
                                      getindex(index);
                                    },
                                    borderWidth: 3,
                                    radiusStyle: true,
                                    fontSize: 15,
                                    minWidth: 110,
                                    minHeight: 45,
                                    cornerRadius: 40,
                                    changeOnTap: true,
                                    inactiveFgColor:
                                        Color.fromARGB(255, 9, 9, 9),
                                    activeFgColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                    inactiveBgColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                    activeBgColor: [greenish],
                                    activeBorders: [
                                      Border.all(
                                        color: greenish,
                                        width: 3.0,
                                      ),
                                      Border.all(
                                        color: greenish,
                                        width: 3.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
                                                padding:
                                                    EdgeInsets.only(bottom: 4),
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
                                                                builder:
                                                                    (context) =>
                                                                        RegisterScreen(),
                                                              ));
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
                                                          height: 34),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // Row(
                                              //   mainAxisAlignment:
                                              //       MainAxisAlignment.center,
                                              //   children: [
                                              //     Expanded(
                                              //       child: Divider(
                                              //         color: Colors.grey,
                                              //         height: 1,
                                              //       ),
                                              //     ),
                                              //     Padding(
                                              //       padding:
                                              //           EdgeInsets.symmetric(
                                              //               horizontal: 10),
                                              //       child: Text(
                                              //         'Company Access',
                                              //         style: TextStyle(
                                              //             fontWeight:
                                              //                 FontWeight.w500,
                                              //             fontSize: 18,
                                              //             color:
                                              //                 Colors.black54),
                                              //       ),
                                              //     ),
                                              //     Expanded(
                                              //       child: Divider(
                                              //         color: Colors.grey,
                                              //         height: 1,
                                              //       ),
                                              //     ),
                                              //   ],
                                              // ),
                                              // Padding(
                                              //   padding:
                                              //       EdgeInsets.only(bottom: 20),
                                              //   child: CompanyAccessCard(
                                              //     title: 'Company Access',
                                              //     onPressed: () {
                                              //       Navigator.push(
                                              //         context,
                                              //         MaterialPageRoute(
                                              //             builder: (context) =>
                                              //                 LoginCompanyScreen()),
                                              //       );
                                              //     },
                                              //     imgicon:
                                              //         "assets/icons/home.svg",
                                              //   ),
                                              // ),
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
                                                      gapPadding: 50),
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
                                            // Padding(
                                            //   padding:   EdgeInsets.only(
                                            //       bottom: 24),
                                            //   child: InputField1(
                                            //     controller: authController.phone,
                                            //     icon: 'assets/images/phone.svg',
                                            //     hint: 'Phone Number',
                                            //   ),
                                            // ),
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
                                            // Padding(
                                            //   padding:   EdgeInsets.only(
                                            //       top: 40),
                                            //   child: Row(
                                            //     mainAxisAlignment:
                                            //         MainAxisAlignment.center,
                                            //     children: [
                                            //       Expanded(
                                            //         child: Divider(
                                            //           color: Colors.grey,
                                            //           height: 1,
                                            //         ),
                                            //       ),
                                            //       Padding(
                                            //         padding:
                                            //             EdgeInsets.symmetric(
                                            //                 horizontal: 10),
                                            //         child: Text(
                                            //           'Or login with',
                                            //           style: TextStyle(
                                            //               fontWeight:
                                            //                   FontWeight.w500,
                                            //               fontSize: 18,
                                            //               color:
                                            //                   Colors.black54),
                                            //         ),
                                            //       ),
                                            //       Expanded(
                                            //         child: Divider(
                                            //           color: Colors.grey,
                                            //           height: 1,
                                            //         ),
                                            //       ),
                                            //     ],
                                            //   ),
                                            // ),
                                            // Padding(
                                            //   padding:   EdgeInsets.only(
                                            //       top: 25, bottom: 20),
                                            //   child: Row(
                                            //     mainAxisAlignment:
                                            //         MainAxisAlignment.center,
                                            //     children: [
                                            //       Image.asset(
                                            //           "assets/images/google.png",
                                            //           height: 34),
                                            //       // Padding(
                                            //       //     padding: EdgeInsets.only(
                                            //       //         left: 12, right: 12)),
                                            //       // Image.asset(
                                            //       //     "assets/images/apple.png",
                                            //       //     height: 34),
                                            //     ],
                                            //   ),
                                            // ),
                                            // Padding(
                                            //   padding: const EdgeInsets.only(
                                            //       top: 30.0),
                                            //   child: Row(
                                            //     mainAxisAlignment:
                                            //         MainAxisAlignment.center,
                                            //     children: [
                                            //       Expanded(
                                            //         child: Divider(
                                            //           color: Colors.grey,
                                            //           height: 1,
                                            //         ),
                                            //       ),
                                            //       Padding(
                                            //         padding:
                                            //             EdgeInsets.symmetric(
                                            //                 horizontal: 10),
                                            //         child: Text(
                                            //           'Company Access',
                                            //           style: TextStyle(
                                            //               fontWeight:
                                            //                   FontWeight.w500,
                                            //               fontSize: 18,
                                            //               color:
                                            //                   Colors.black54),
                                            //         ),
                                            //       ),
                                            //       Expanded(
                                            //         child: Divider(
                                            //           color: Colors.grey,
                                            //           height: 1,
                                            //         ),
                                            //       ),
                                            //     ],
                                            //   ),
                                            // ),
                                            // Padding(
                                            //   padding:
                                            //       EdgeInsets.only(bottom: 20),
                                            //   child: CompanyAccessCard(
                                            //     title: 'Company Access',
                                            //     onPressed: () {
                                            //       Navigator.push(
                                            //         context,
                                            //         MaterialPageRoute(
                                            //             builder: (context) =>
                                            //                 LoginCompanyScreen()),
                                            //       );
                                            //     },
                                            //     imgicon:
                                            //         "assets/icons/home.svg",
                                            //   ),
                                            // ),
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
