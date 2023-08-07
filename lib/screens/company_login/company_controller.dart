import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/api/api.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/models/user.dart';
import 'package:translation/values/string.dart';
import 'package:translation/values/validator.dart';

class CompanyController extends GetxController {
  static CompanyController instance = Get.find();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool validateSignInForm = false.obs;

  void SignIn(void Function(bool) callback) async {
    LoadingHelper.show();
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
        if (response['User']['is_company'] == 1) {
          GetStorage box = GetStorage();
          box.remove('api_token');
          User user = User(response['User']);
          box.write('api_token', user.apiToken);
          box.write('user_id', user.id);
          LoadingHelper.dismiss();
          ClearSignupVariables();
          update();
          return callback(true);
        } else {
          LoadingHelper.dismiss();
          Get.snackbar('ERROR!', 'Company is not associated with this email.',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white);
          return callback(false);
        }
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

  ClearSignupVariables() {
    password.clear();
    email.clear();
    update();
  }

  void showSignInErrors() {
    validateSignInForm = true.obs;
  }
}
