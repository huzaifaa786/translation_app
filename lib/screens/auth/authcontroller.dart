import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:translation/api/api.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/models/user.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:translation/screens/main_screen/home.dart';
import 'package:translation/services/auth_services/google_services.dart';
import 'package:translation/services/auth_services/mobileotp_services.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/values/controllers.dart';
import 'package:translation/values/string.dart';
import 'package:translation/values/validator.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  RxBool validateSignUpForm = false.obs;
  RxBool validateSignInForm = false.obs;
  RxBool success = new RxBool(true);
  TextEditingController email = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController phone = TextEditingController();

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////// Show auth Errors //////////////////////////////////////////////////

  void showErrors() {
    validateSignUpForm = true.obs;
  }

  void showSignInErrors() {
    validateSignInForm = true.obs;
  }

//////////////////////////////////////////// Clear Auth Variables ///////////////////////////////////////////

  ClearSignupVariables() {
    userName.clear();
    phone.clear();
    password.clear();
    email.clear();
    confirmPassword.clear();
  }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////// Register Screen Functionality //////////////////////////////////////////

  void SignUp(void Function(bool) callback) async {
    LoadingHelper.show();
    final bool isFormValid =
        Validators.emptyStringValidator(email.text, '') == null &&
            Validators.emptyStringValidator(userName.text, '') == null &&
            Validators.emptyStringValidator(password.text, '') == null &&
            Validators.emptyStringValidator(phone.text, '') == null &&
            Validators.emptyStringValidator(confirmPassword.text, '') == null;
    if (isFormValid) {
      if (password.text == confirmPassword.text) {
        GetStorage box = GetStorage();
        var url = BASE_URL + 'user/register';
        var token = await FirebaseMessaging.instance.getToken();
        var data;
        //////////// Register Data /////////////
        data = {
          'email': email.text.toString(),
          'username': userName.text.toString(),
          'password': password.text.toString(),
          'phone': phone.text.toString(),
          'firebase_token': token,
          'user_type': 'Email',
        };

        var response = await Api.execute(
          url: url,
          data: data,
        );

        if (!response['error']) {
          LoadingHelper.dismiss();
          User user = User(response['Vendor']);
          box.write('api_token', user.apiToken);
          box.write('user_id', user.id);
          ClearSignupVariables();
          update();
          return callback(true);
        } else {
          LoadingHelper.dismiss();
          Get.snackbar("Error!", response['error_data'],
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white);
          return callback(false);
        }
      } else {
        LoadingHelper.dismiss();
        Get.snackbar(
            "Invalid Password.", 'Passowrd And Confirm passsword must be same.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    } else {
      LoadingHelper.dismiss();
      showErrors();
    }
  }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////// Login Screen Functionality /////////////////////////////////////////////

  void SignIn(void Function(bool) callback) async {
    LoadingHelper.show();
    print('objcvcect');
    print(email.text);
    print(password.text);
    final bool isFormValid =
        Validators.emptyStringValidator(email.text, '') == null &&
            Validators.emptyStringValidator(password.text, '') == null;
    if (isFormValid) {
      var url = BASE_URL + 'user/login';
      var token = await FirebaseMessaging.instance.getToken();
      var data = {
        'email': email.text,
        'password': password.text,
        'firebase_token': token,
      };

      var response = await Api.execute(url: url, data: data);
      if (!response['error']) {
        User user = User(response['User']);
        GetStorage box = GetStorage();
        box.write('api_token', user.apiToken);
        box.write('user_id', user.id);
        LoadingHelper.dismiss();
        ClearSignupVariables();
        update();
        return callback(true);
      } else {
        LoadingHelper.dismiss();
        print(response['error_data']);
        Get.snackbar('ERROR!', response['error_data'],
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
        return callback(false);
      }
    } else {
      LoadingHelper.dismiss();
      print('error');
      showSignInErrors();
    }
  }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////// Forgot Screen Functionality & Variables /////////////////////////////////

  TextEditingController forgotemail = TextEditingController();
  TextEditingController resetPassword = TextEditingController();
  var otp;
  RxBool verify = true.obs;
  RxBool validateForgotForm = false.obs;

////////////////////////////////// Clear Forgot Screen Variables //////////////////////////////////////////////

  ClearForgotVariable() {
    forgotemail.clear();
    resetPassword.clear();
    update();
  }

////////////////////////////////// Show Errors For Invalid Input ////////////////////////////////////////////////

  void showError() {
    validateForgotForm = true.obs;
    update();
  }

////////////////////////////////// Fetch User AND Send Otp to Mail if user exit ////////////////////////////////

  getOTPusingEmail(void Function(bool) callback) async {
    LoadingHelper.show();
    print(forgotemail.text);
    if (forgotemail.text.isNotEmpty) {
      var url = BASE_URL + 'forgetuserpassword';
      var data = {'email': forgotemail.text.toString()};

      var response = await Api.execute(url: url, data: data);
      LoadingHelper.dismiss();
      if (!response['error']) {
        otp = response['otp'];
        Get.snackbar('OTP sent successfully!',
            'We have sent a One-Time Password (OTP) to your registered email address.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: greenish,
            colorText: Colors.white);
        return callback(true);
      } else {
        LoadingHelper.dismiss();
        print(response['error_data']);
        Get.snackbar('ERROR!', response['error_data'],
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
        return callback(false);
      }
    } else {
      LoadingHelper.dismiss();
    }
  }

//////////////////// Call This function after otp Successfully placed to reset Password ////////////////////

  ResetPassword(void Function(bool) callback) async {
    print(resetPassword.text);
    final bool isFormValid =
        Validators.passwordValidator(resetPassword.text) == null;
    if (!isFormValid) {
      return callback(false);
    } else {
      LoadingHelper.show();
      var url = BASE_URL + 'forgetchangepassword';
      var data = {
        'email': forgotemail.text.toString(),
        'password': resetPassword.text.toString()
      };
      var response = await Api.execute(url: url, data: data);
      print(response);
      if (!response['error']) {
        LoadingHelper.dismiss();
        // GetStorage box = GetStorage();
        // box.write('api_token', response['update']['api_token']);
        ClearForgotVariable();
        return callback(true);
      } else {
        LoadingHelper.dismiss();
        return callback(false);
      }
    }
  }

//////////////////////////////////////////// Google Login OR Register ////////////////////////////////////////

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  signInwithGoogle() async {
    try {
      LoadingHelper.show();
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      var email1 = googleSignInAccount!.email;
      var name = googleSignInAccount.displayName;
      var image = googleSignInAccount.photoUrl;
      print('image');
      print(image);

      LoadingHelper.dismiss();
      if (await GoogleServices.googlelogin(email1)) {
        Get.to(() => Home_screen());
      } else {
        if (await GoogleServices.googleSignup(name, email1, 'google')) {
          Get.to(() => Home_screen());
        }
      }
    } catch (e) {
      Get.snackbar('Google SignIn Failed!', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          colorText: white,
          backgroundColor: Colors.red);
      LoadingHelper.dismiss();
    }
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////// OTP Login  ///////////////////////////////////////////////////////
  String? completeNumber = '';

  getuser() async {
    print('completeNumber');
    print(completeNumber);
    var muser = await Mobilelogin(completeNumber);
    if (muser == null) {
      LoadingHelper.dismiss();
      otpServices.sendTokenforSignUP(completeNumber.toString());
    } else {
      User user = muser;
      LoadingHelper.dismiss();
      otpServices.sendToken(completeNumber.toString(), user);
    }
  }

  static Mobilelogin(phone) async {
    LoadingHelper.show();
    var url = BASE_URL + 'otplogin';
    var data = {
      'phone': phone,
    };

    var response = await Api.execute(url: url, data: data);
    LoadingHelper.dismiss();
    if (!response['error']) {
      User user = User(response['data']);
      return user;
    } else {
      return null;
    }
  }

  ////////////////////////////////Register Using OTp after verifying //////////////////////////////////

  void OtpSignUp(void Function(bool) callback) async {
    LoadingHelper.show();
    final bool isFormValid =
        Validators.emptyStringValidator(email.text, '') == null &&
            Validators.emptyStringValidator(userName.text, '') == null;
    if (isFormValid) {
      GetStorage box = GetStorage();
      var url = BASE_URL + 'user/register';
      var token = await FirebaseMessaging.instance.getToken();
      var data;
      //////////// Register Data /////////////
      data = {
        'email': email.text.toString(),
        'username': userName.text.toString(),
        'user_type': 'OTP',
        'phone': authController.completeNumber,
        'firebase_token': token,
      };

      var response = await Api.execute(
        url: url,
        data: data,
      );

      if (!response['error']) {
        LoadingHelper.dismiss();
        User user = User(response['Vendor']);
        box.write('api_token', user.apiToken);
        box.write('user_id', user.id);
        ClearSignupVariables();
        update();
        return callback(true);
      } else {
        LoadingHelper.dismiss();
        Get.snackbar("Error!", response['error_data'],
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
        return callback(false);
      }
    } else {
      LoadingHelper.dismiss();
      showErrors();
    }
  }

  clear() {
    completeNumber = '';
    phone.clear();
    email.clear();
    password.clear();
    update();
  }
}
