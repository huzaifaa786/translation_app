import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:translation/static/large_button.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/static/input_field1.dart';

class LoginCompanyScreen extends StatefulWidget {
  const LoginCompanyScreen({super.key});

  @override
  State<LoginCompanyScreen> createState() => _LoginCompanyScreenState();
}

class _LoginCompanyScreenState extends State<LoginCompanyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
                child: Center(
                  child: Image(
                    image: AssetImage("assets/images/splashLogo.png"),
                    color: white,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: MediaQuery.of(context).size.height * 0.66,
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
                          padding: const EdgeInsets.only(top: 30, bottom: 30),
                          child: Text(
                            'COMPANY LOG IN',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: greenish),
                          ),
                        ),
                        InputField1(
                          hint: 'Email Address',
                          icon: 'assets/images/email.svg',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 20),
                          child: InputField1(
                            hint: 'Password',
                            icon: 'assets/images/lock.svg',
                            obscure: true,
                          ),
                        ),
                        LargeButton(
                          title: 'Login',
                          sreenRatio: 0.9,
                          onPressed: () {},
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
      ),
    );
  }
}
