import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/screens/login/otp_verify/loginOtp.dart';
import 'package:translation/screens/login/otp_verify/signup.dart';
import 'package:translation/values/colors.dart';

class OTPServices extends GetxController {
  static OTPServices instance = Get.find();

  RxString? last2;
  String verificationid = "";
  int? resendtoken;
  String? otp;

/////////////////////////// SignIn Send Token /////////////////////////////////////////////////////////////

  void sendToken(String phone) async {
    LoadingHelper.show();
    log('log ???????????????????????????????????????? 01');
    print(phone);

    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.verifyPhoneNumber(
        timeout: const Duration(minutes: 2),
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {},
        verificationFailed: (FirebaseAuthException e) {
          LoadingHelper.dismiss();
          Get.snackbar('Verification failed', e.message!,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: primaryTextColor);
        },
        forceResendingToken: resendtoken,
        codeSent: (String verificationId, int? resendToken) {
          last2 = phone.substring(phone.length - 2).obs;
          verificationid = verificationId;
          resendtoken = resendToken;
          LoadingHelper.dismiss();
          Get.snackbar('OTP has been successfully send signin', '',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: primaryTextColor);
          log('log ?????????????????? phone verification?????????????????????? 04');
          Get.to(() => LoginOtpVerifyScreen);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationid = verificationId;
          Get.snackbar('TIMEOUT', '',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: primaryTextColor);
        },
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Verification Failed', e.message!,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: primaryTextColor);
    }
  }

/////////////////////////// SignUP Send Token /////////////////////////////////////////////////////////////

  void sendTokenforSignUP(String phone) async {
    LoadingHelper.show();
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.verifyPhoneNumber(
        timeout: const Duration(minutes: 2),
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {},
        verificationFailed: (FirebaseAuthException e) {
          LoadingHelper.dismiss();
          Get.snackbar('Verification failed', e.message!,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: primaryTextColor);
        },
        forceResendingToken: resendtoken,
        codeSent: (String verificationId, int? resendToken) {
          verificationid = verificationId;
          resendtoken = resendToken;
          LoadingHelper.dismiss();
          Get.snackbar('OTP has been successfully send SIgnup', '',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: primaryTextColor);
          Get.to(() => SignUpOtpVerifyScreen());
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationid = verificationId;
          Get.snackbar('TIMEOUT', '',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: primaryTextColor);
        },
      );
    } on FirebaseAuthException catch (e) {
      LoadingHelper.dismiss();
      Get.snackbar('Verification Failed', e.message!,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: primaryTextColor);
    }
  }

/////////////////////////// Verify Otp Token ///////////////////////////////////////////////////////////////

  void verifyPhone() async {
    try {
      if (otp!.length == 6) {
        LoadingHelper.show();
        await FirebaseAuth.instance
            .signInWithCredential(PhoneAuthProvider.credential(
          verificationId: verificationid,
          smsCode: otp!,
        ))
            .then((value) async {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => CheckOutScreen(
          //               data: carinfo,
          //             )));
          LoadingHelper.dismiss();
        });
      } else {
        Get.snackbar('Error!', 'Plese Enter Complete Code',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: white);
      }
    } on FirebaseAuthException catch (e) {
      LoadingHelper.dismiss();
      Get.snackbar('Error!', e.message!,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: white);
    }
  }

////////////////////////////////////////////////////////

  clear() {
    verificationid = "";
  }
}
