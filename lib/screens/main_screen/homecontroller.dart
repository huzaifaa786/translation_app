import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translation/api/api.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/models/filter.dart';
import 'package:translation/models/order.dart';
import 'package:translation/models/user.dart';
import 'package:translation/models/vendor.dart';
import 'package:translation/screens/auth/login_screen.dart';
import 'package:translation/screens/translator_screens/notranslator.dart';
import 'package:translation/screens/translator_screens/translator_screen.dart';
import 'package:translation/values/string.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:developer';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  String? fromSelectedLanguage;
  TextEditingController searchController = TextEditingController();
  TextEditingController toSearchController = TextEditingController();
  String? toSelectedLanguage;
  List<Vendor> vendors = [];
  List<Vendor> searchVendor = [];
  List<Vendor> onlineVendor = [];
  List<Vendor> schedule = [];
  List<Vendor> sonlineVendor = [];
  List<Vendor> sschedule = [];
  User? user;

/////////////////////////////////// Clear Variables /////////////////////////////////////////////////////////

  clear() {
    vendors = [];
    searchVendor = [];
    onlineVendor = [];
    schedule = [];
    sonlineVendor = [];
    sschedule = [];
    fromSelectedLanguage = null;
    toSelectedLanguage = null;
  }

/////////////////////////////////// Get User /////////////////////////////////////////////////////////

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
      update();
    } else {
      if (response['error_data'] == "Unauthorized access") {
        GetStorage box = GetStorage();
        box.remove('api_token');
        Get.offAll(() => LoginScreen());
        LoadingHelper.dismiss();
        Get.snackbar("Error!", response['error_data'],
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      } else {
        LoadingHelper.dismiss();
        Get.snackbar("Error!", response['error_data'],
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    }
  }

/////////////////////////////////// Online / Offline Vendor Fetch /////////////////////////////////////////////////////////

  void fetchVendors() async {
    print(fromSelectedLanguage);
    GetStorage box = GetStorage();
    LoadingHelper.show();
    print(box.read('api_token'));
    var url = BASE_URL + 'vendor/search';
    var data = {
      'api_token': box.read('api_token'),
      'form': fromSelectedLanguage,
      'to': toSelectedLanguage,
    };
    var response = await Api.execute(url: url, data: data);
    LoadingHelper.dismiss();
    if (!response['error']) {
      List<Vendor> vendor = <Vendor>[];
      for (var van in response['vendor']) {
        vendor.add(Vendor(van));
      }
      vendors = vendor;
      // print(vendor.first.service!.schedual!.first.day);
      searchVendor = vendor;
      onlineVendor = vendor.where((i) => i.online == 1).toList();
      schedule = vendor;
      sonlineVendor = onlineVendor;
      sschedule = schedule;
      update();

      if (vendor.isNotEmpty) {
        Get.to(() => Translator_());
      } else {
        print(vendor);
        Get.to(() => NoTransFound_screen());
      }
    } else {
      LoadingHelper.dismiss();
      Get.snackbar("Error!", response['error_data'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

//////////////////////////////////// Search Both Vendors ////////////////////////////////////////////////////////////

  void searchVendors(String query) {
    if (query == '') {
      sonlineVendor = onlineVendor;
      sschedule = schedule;
      update();
    } else {
      sonlineVendor = onlineVendor
          .where((o) =>
              o.name!.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
      sschedule = schedule
          .where((o) =>
              o.name!.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
      update();
    }
  }

//////////////////////////////////// Search Online Vendors ////////////////////////////////////////////////////////////

  void searchOnlineOrders(String query) {
    if (query == '') {
      sonlineVendor = onlineVendor;
    } else {
      sonlineVendor = onlineVendor
          .where((o) =>
              o.name!.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    update();
  }

//////////////////////////////////// Search Offile Vendors ////////////////////////////////////////////////////////////

  void searchOfflineOrders(String query) {
    if (query == '') {
      sschedule = schedule;
      update();
    } else {
      sschedule = schedule
          .where((o) =>
              o.name!.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
      update();
    }
  }

//////////////////////////////////// Update Vendors on return Back ////////////////////////////////////////////////////////////

  offlineVendorUpdate() {
    sschedule = schedule;
    update();
  }

  onlineVendorUpdate() {
    sonlineVendor = onlineVendor;
    update();
  }

//////////////////////////////////// filter offline vendors/////////////////////////////////////////////////

  void filterOfflineOrder(String? rating, String? price) {
    if (rating == "Highest to lowest rating") {
      sschedule = schedule;
      sschedule.sort(
          (a, b) => double.parse(b.rating!).compareTo(double.parse(a.rating!)));
      if (price == "Highest price to lowest price") {
        sschedule.sort((a, b) => double.parse(b.service!.audiovideo!)
            .compareTo(double.parse(a.service!.audiovideo!)));
      } else if (price == "lowest to Highest price") {
        sschedule.sort((a, b) => double.parse(a.service!.audiovideo!)
            .compareTo(double.parse(b.service!.audiovideo!)));
      }
    } else if (rating == "lowest to highest rating") {
      sschedule = schedule;
      sschedule.sort(
          (a, b) => double.parse(a.rating!).compareTo(double.parse(b.rating!)));
      if (price == "Highest price to lowest price") {
        sschedule.sort((a, b) => double.parse(b.service!.audiovideo!)
            .compareTo(double.parse(a.service!.audiovideo!)));
      } else if (price == "lowest to Highest price") {
        sschedule.sort((a, b) => double.parse(a.service!.audiovideo!)
            .compareTo(double.parse(b.service!.audiovideo!)));
      }
    } else {
      if (price == "Highest price to lowest price") {
        sschedule.sort((a, b) => double.parse(b.service!.audiovideo!)
            .compareTo(double.parse(a.service!.audiovideo!)));
      } else if (price == "lowest to Highest price") {
        sschedule.sort((a, b) => double.parse(a.service!.audiovideo!)
            .compareTo(double.parse(b.service!.audiovideo!)));
      }
    }
    update();
  }

//////////////////////////////////// filter Online Vendors /////////////////////////////////////////////////

  filterOnlineOrder(String? rating, String? price) {
    if (rating == "Highest to lowest rating") {
      sonlineVendor = onlineVendor;
      sonlineVendor.sort(
          (a, b) => double.parse(b.rating!).compareTo(double.parse(a.rating!)));
      if (price == "Highest price to lowest price") {
        sonlineVendor.sort((a, b) =>
            double.parse(b.service!.onlineaudiovideoPrice!)
                .compareTo(double.parse(a.service!.onlineaudiovideoPrice!)));
      } else if (price == "lowest price to Highest price") {
        sonlineVendor.sort((a, b) =>
            double.parse(a.service!.onlineaudiovideoPrice!)
                .compareTo(double.parse(b.service!.onlineaudiovideoPrice!)));
      }
    } else if (rating == "lowest to highest rating") {
      sonlineVendor = onlineVendor;
      sonlineVendor.sort(
          (a, b) => double.parse(a.rating!).compareTo(double.parse(b.rating!)));
      if (price == "Highest price to lowest price") {
        sonlineVendor.sort((a, b) =>
            double.parse(b.service!.onlineaudiovideoPrice!)
                .compareTo(double.parse(a.service!.onlineaudiovideoPrice!)));
      } else if (price == "lowest price to Highest price") {
        sonlineVendor.sort((a, b) =>
            double.parse(a.service!.onlineaudiovideoPrice!)
                .compareTo(double.parse(b.service!.onlineaudiovideoPrice!)));
      }
    } else {
      if (price == "Highest price to lowest price") {
        sonlineVendor.sort((a, b) =>
            double.parse(b.service!.onlineaudiovideoPrice!)
                .compareTo(double.parse(a.service!.onlineaudiovideoPrice!)));
      } else if (price == "lowest price to Highest price") {
        sonlineVendor.sort((a, b) =>
            double.parse(a.service!.onlineaudiovideoPrice!)
                .compareTo(double.parse(b.service!.onlineaudiovideoPrice!)));
      }
    }
    update();
  }

/////////////////////////////////// Check Notifications /////////////////////////////////////////////////////////

  CheckNotications() async {
    LoadingHelper.show();
    var url = BASE_URL + 'user/check';
    GetStorage box = GetStorage();

    String api_token = box.read('api_token');
    var data = {'api_token': api_token};
    var response = await Api.execute(url: url, data: data);
    print(response);
    LoadingHelper.dismiss();
    if (response['exist'] == true) {
      return true;
    } else {
      return false;
    }
  }

  getratting() async {
    LoadingHelper.show();
    var url = BASE_URL + 'ratting/get';

    GetStorage box = GetStorage();
    int user_id = box.read('user_id');
    int api_token= box.read('api_token');

    var data = {'user_id': user_id, 'api_token': api_token};
    var response = await Api.execute(url: url, data: data);
    print(response);
    LoadingHelper.dismiss();

    // Check if the 'has_rating' field is present in the response and its value is true
    if (response['order'] != null) {
      return Order(response['order']);
    } else {
      return;
    }
  }
}
