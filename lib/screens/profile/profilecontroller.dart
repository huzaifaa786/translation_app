import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:translation/api/api.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/values/string.dart';
import 'package:translation/values/validator.dart';

class ProfileController extends GetxController {
  static ProfileController instance = Get.find();
  RxBool validateChangepasswordForm = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController currentpasswordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  String? name;
  File? imageFile;
  void showErrors() {
    validateChangepasswordForm = true.obs;
  }

  ClearchangepasswordVariables() {
    currentpasswordController.clear();
    newpasswordController.clear();
    confirmpasswordController.clear();
  }

  _getFromGallery() async {
    ImagePicker pickedFile = await ImagePicker();
    if (pickedFile != null) {
      imageFile = File(pickedFile.toString());
      update();
    }
  }

  void changepassword(void Function(bool) callback) async {
    LoadingHelper.show();
    final bool isFormValid = Validators.emptyStringValidator(
                newpasswordController.text, '') ==
            null &&
        Validators.emptyStringValidator(confirmpasswordController.text, '') ==
            null;
    if (isFormValid) {
      if (newpasswordController.text == confirmpasswordController.text) {
        var url = BASE_URL + 'user/changepassword';
        GetStorage box = GetStorage();
        String api_token = box.read('api_token');
        print(api_token);
        var data = {
          'api_token': api_token,
          'password': currentpasswordController.text.toString(),
          'newpassword': newpasswordController.text.toString()
        };
        var response = await Api.execute(url: url, data: data);
        print(response);
        if (!response['error']) {
          LoadingHelper.dismiss();
          update();
          ClearchangepasswordVariables();

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
        return callback(false);
      }
    } else {
      LoadingHelper.dismiss();
      showErrors();
    }
  }
}
