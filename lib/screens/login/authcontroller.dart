import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/api/api.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/models/user.dart';

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

  void showErrors() {
    validateSignUpForm = true.obs;
  }

  void showSignInErrors() {
    validateSignInForm = true.obs;
  }

  ClearSignupVariables() {
    userName.clear();
    phone.clear();
    password.clear();
    email.clear();
    confirmPassword.clear();
  }

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
        var url = BASE_URL + 'user/register';
        var data;
        data = {
          'email': email.text.toString(),
          'username': userName.text.toString(),
          'password': password.text.toString(),
          'phone': phone.text.toString(),
        };

        var response = await Api.execute(
          url: url,
          data: data,
        );

        if (!response['error']) {
          LoadingHelper.dismiss();
          User user = User(response['user']);
          print(User);
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

    void login(void Function(bool) callback) async {
      LoadingHelper.show();
      print('object');
      final bool isFormValid =
          Validators.emptyStringValidator(email.text, '') == null &&
              Validators.emptyStringValidator(password.text, '') == null;
      if (isFormValid) {
        var url = BASE_URL + 'vendor/login';
        // var token = await FirebaseMessaging.instance.getToken();
        var data = {
          'email': userName.text,
          'password': password.text,
          // 'firebase_token': token,
        };

        var response = await Api.execute(url: url, data: data);
        if (!response['error']) {
          User user = User(response['user']);
          GetStorage box = GetStorage();
          box.write('api_token', user.apiToken);
          LoadingHelper.dismiss();
          return callback(true);
        } else {
          LoadingHelper.dismiss();
          Get.snackbar('ERROR!', response['error_data'],
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white);
          return callback(false);
        }
      } else {
        LoadingHelper.dismiss();
        showSignInErrors();
      }
    }
  }
}
