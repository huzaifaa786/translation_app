import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:translation/api/api.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/models/user.dart';
import 'package:translation/values/controllers.dart';
import 'package:translation/values/string.dart';
import 'package:translation/values/validator.dart';

class ProfileController extends GetxController {
  static ProfileController instance = Get.find();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController currentpasswordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  RxBool validateChangepasswordForm = false.obs;
  String? name;
  XFile? profileImage = XFile('');
  User? user;

  Future<void> selectProfileImage() async {
    final ImagePicker _picker = ImagePicker();
    var image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      profileImage = image;
      update();
    }
  }

  clearField() {
    profileImage = XFile('');
  }

  getuser() async {
    LoadingHelper.show();
    var url = BASE_URL + 'user/get';
    var data;
    GetStorage box = GetStorage();
    print(box.read('api_token'));
    data = {'api_token': box.read('api_token')!};
    var response = await Api.execute(url: url, data: data);
    LoadingHelper.dismiss();
    if (!response['error']) {
      user = User(response['user']);
      nameController.text = user!.username!;
      phoneController.text = user!.number!;
      emailController.text = user!.email!;
      update();
    } else {
      Get.snackbar("Error!", response['error_data'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  EditProfile(void Function(bool) callback) async {
    LoadingHelper.show();
    var url = BASE_URL + 'user/update';
    GetStorage box = GetStorage();
    print(box.read('api_token'));
    print(nameController.text);
    if (profileImage!.path == '') {
      var data = {
        'api_token': box.read('api_token'),
        'username': nameController.text.toString(),
      };
      var response = await Api.execute(url: url, data: data);
      LoadingHelper.dismiss();
      if (!response['error']) {
        user = User(response['user']);
        homeController.user = User(response['user']);
        homeController.refresh();
        update();
        return callback(true);
      } else {
        Get.snackbar("Error!", response['error_data'],
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
        return callback(false);
      }
    } else {
      final profilepic =
          base64Encode(File(profileImage!.path).readAsBytesSync());
      var data = {
        'api_token': box.read('api_token'),
        'profilepic': profilepic,
        'username': nameController.text.toString(),
      };
      print(data);
      var response = await Api.execute(url: url, data: data);
      LoadingHelper.dismiss();
      if (!response['error']) {
        user = User(response['user']);
        update();
        return callback(true);
      } else {
        Get.snackbar("Error!", response['error_data'],
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
        return callback(false);
      }
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

  ClearchangepasswordVariables() {
    currentpasswordController.clear();
    newpasswordController.clear();
    confirmpasswordController.clear();
  }

  void showErrors() {
    validateChangepasswordForm = true.obs;
  }
}
