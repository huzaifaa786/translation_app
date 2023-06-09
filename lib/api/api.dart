import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translation/helper/loading.dart';

class Api {
  static execute({url, data}) async {
    try {
      var result;

      Dio dio = Dio();
      print(url);
      print(data);
      result = await dio.post(url, data: data);
      print(result);
      var response = jsonDecode(result.toString());
      print(response.toString());

      return response;
    } catch (e) {
      LoadingHelper.dismiss();
      Get.snackbar('API ERROR!', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
