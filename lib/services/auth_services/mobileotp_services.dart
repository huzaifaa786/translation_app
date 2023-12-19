import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/screens/auth/otp_signup.dart';
import 'package:translation/screens/auth/otp_verify/loginOtp.dart';
import 'package:translation/screens/auth/otp_verify/signup.dart';
import 'package:translation/screens/main_screen/home.dart';
import 'package:translation/values/colors.dart';

class OTPServices extends GetxController {
  static OTPServices instance = Get.find();

  RxString? last2;
  String verificationid = "";
  int? resendtoken;
  String? otp;
  String? api_Token;
  int? user_id;

/////////////////////////// SignIn Send Token /////////////////////////////////////////////////////////////

  void sendToken(String phone, users) async {
    LoadingHelper.show();
    log('log ???????????????????????????????????????? 01');
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
          last2 = phone.substring(phone.length - 3).obs;
          verificationid = verificationId;
          resendtoken = resendToken;
          LoadingHelper.dismiss();
          Get.snackbar('OTP has been successfully sent', '',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: primaryTextColor);
          log('log ?????????????????? phone verification?????????????????????? 04');
          Get.to(() => LoginOtpVerifyScreen(user: users));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationid = verificationId;
          // Get.snackbar('TIMEOUT', '',
          //     snackPosition: SnackPosition.BOTTOM,
          //     backgroundColor: Colors.red,
          //     colorText: primaryTextColor);
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
          Get.snackbar('Verification failed', e.message.toString(),
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: primaryTextColor);
        },
        forceResendingToken: resendtoken,
        codeSent: (String verificationId, int? resendToken) {
          last2 = phone.substring(phone.length - 3).obs;
          verificationid = verificationId;
          resendtoken = resendToken;
          LoadingHelper.dismiss();
          Get.snackbar('OTP has been successfully sent', '',
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

/////////////////////////// Verify Login Otp Token ///////////////////////////////////////////////////////////////

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
          GetStorage box = GetStorage();
          box.write('api_token', api_Token);
          box.write('user_id', user_id);
          Get.offAll(() => Home_screen());
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

//////////////////////////////// Signup otp verify //////////////////////////////////////////////////////////

  SignupverifyPhone() async {
    try {
      if (otp!.length == 6) {
        LoadingHelper.show();
        await FirebaseAuth.instance
            .signInWithCredential(PhoneAuthProvider.credential(
          verificationId: verificationid,
          smsCode: otp!,
        ))
            .then((value) {
          Get.to(() => OtpRegisterScreen());
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
