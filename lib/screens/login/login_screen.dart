// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:translation/screens/Otp/verifyphoneno.dart';
import 'package:translation/screens/main_screen/home.dart';
import 'package:translation/screens/login/sign_up.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/static/input_field1.dart';
import 'package:translation/static/large_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int index = 0;

  getindex(id) async {
    setState(() {
      index = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
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
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 250, 250, 250),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
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
                                  offset: const Offset(0, 3))
                            ],
                          ),
                          child: ToggleSwitch(
                            initialLabelIndex: index,
                            labels: const [
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
                            inactiveFgColor: const Color.fromARGB(255, 9, 9, 9),
                            activeFgColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            inactiveBgColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            activeBgColor: const [greenish],
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
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              height: MediaQuery.of(context).size.height * 0.65,
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 20, bottom: 20),
                                        child: Text(
                                          'WELCOME BACK',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600,
                                              color: greenish),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 4),
                                        child: InputField1(
                                          icon: 'assets/images/email.svg',
                                          hint: 'Email Address',
                                        ),
                                      ),
                                      InputField1(
                                        icon: 'assets/images/lock.svg',
                                        hint: 'Password',
                                        obscure: true,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12, bottom: 16),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              onTap: () {},
                                              child: Text(
                                                "Forgot Password?",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black54,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      LargeButton(
                                        title: 'Login',
                                        sreenRatio: 0.9,
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    Home_screen(),
                                              ));
                                        },
                                        color: greenish,
                                        textcolor: Colors.white,
                                        buttonWidth: 0.95,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 40, bottom: 25),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'New User ? ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            RegisterScreen(),
                                                      ));
                                                },
                                                child: Text(
                                                  'Register Now',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w600,
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
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              'Or login with',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18,
                                                  color: Colors.black54),
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
                                        padding: const EdgeInsets.only(
                                            top: 25, bottom: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                "assets/images/google.png",
                                                height: 34),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 12, right: 12)),
                                            Image.asset("assets/images/apple.png",
                                                height: 34),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              height: MediaQuery.of(context).size.height * 0.65,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          top: 30, bottom: 30),
                                      child: Text(
                                        'WELCOME BACK',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                            color: greenish),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 24),
                                      child: InputField1(
                                        icon: 'assets/images/phone.svg',
                                        hint: 'Phone Number',
                                      ),
                                    ),
                                    LargeButton(
                                      title: 'Request OTP',
                                      sreenRatio: 0.9,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => VerifyPhone(),
                                            ));
                                      },
                                      color: greenish,
                                      textcolor: Colors.white,
                                      buttonWidth: 0.95,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 40),
                                      child: Row(
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
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              'Or login with',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18,
                                                  color: Colors.black54),
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
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, bottom: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset("assets/images/google.png",
                                              height: 34),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 12, right: 12)),
                                          Image.asset("assets/images/apple.png",
                                              height: 34),
                                        ],
                                      ),
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
        ),
      ),
    );
  }
}
