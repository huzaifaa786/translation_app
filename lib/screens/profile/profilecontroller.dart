import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  static ProfileController instance = Get.find();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? name;
  File? imageFile;

  _getFromGallery() async {
    ImagePicker pickedFile = await ImagePicker();
    if (pickedFile != null) {
      imageFile = File(pickedFile.toString());
      update();
    }
  }
}
