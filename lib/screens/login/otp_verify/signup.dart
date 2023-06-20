import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translation/screens/forgot.dart/resetPassword.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/static/large_button.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:translation/values/controllers.dart';

class SignUpOtpVerifyScreen extends StatefulWidget {
  const SignUpOtpVerifyScreen({super.key});

  @override
  State<SignUpOtpVerifyScreen> createState() => _SignUpOtpVerifyScreenState();
}

class _SignUpOtpVerifyScreenState extends State<SignUpOtpVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Image.asset("assets/images/otplogo.png"),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Verify Your Email',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  padding: EdgeInsets.all(4),
                  child: Text(
                    'Entered the 4 digit code received on your entered email.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                OtpTextField(
                  margin: EdgeInsets.only(right: 14),
                  numberOfFields: 6,
                  fieldWidth: 50,
                  borderColor: greenish,
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) {
                    if (otpServices.otp.toString() == verificationCode) {
                      authController.verify = true.obs;
                      // Get.to(() => ResetPasswordScreen());
                    } else {
                      authController.verify = false.obs;
                    }
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                // Center(
                //   child: Container(
                //     width: 70,
                //     height: 30,
                //     alignment: Alignment.center,
                //     decoration: BoxDecoration(
                //       color: Colors.grey[200],
                //       borderRadius: BorderRadius.circular(5.0),
                //     ),
                //     child: Text(
                //       '00:59',
                //       style: TextStyle(
                //         fontSize: 15.0,
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     // Get.to(() => RegisterScreen());
                //   },
                //   child: Center(
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Text('Not received ? '),
                //         Text(
                //           'Resend',
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             color: greenish,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: LargeButton(
                  title: 'Submit',
                  sreenRatio: 0.85,
                  onPressed: () {
                    if (authController.verify.value == true) {
                      Get.snackbar('OTP verified successfully!',
                          'You have successfully completed the verification process.',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: greenish,
                          colorText: Colors.white);
                      Get.to(() => ResetPasswordScreen());
                    } else {
                      Get.snackbar('ERROR!',
                          "Entered Otp is incorrect. Please enter correct Otp to proceed Further.",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white);
                    }
                  },
                  color: greenish,
                  textcolor: Colors.white,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
