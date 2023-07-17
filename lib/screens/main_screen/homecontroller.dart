import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translation/api/api.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/models/filter.dart';
import 'package:translation/models/user.dart';
import 'package:translation/models/vendor.dart';
import 'package:translation/screens/auth/login_screen.dart';
import 'package:translation/screens/translator_screens/notranslator.dart';
import 'package:translation/screens/translator_screens/translator_screen.dart';
import 'package:translation/values/string.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  String? fromSelectedLanguage;
  String? toSelectedLanguage;
  List<Vendor> vendors = [];
  List<Vendor> searchVendor = [];
  List<Vendor> onlineVendor = [];
  List<Vendor> offlineVendor = [];
  List<Vendor> sonlineVendor = [];
  List<Vendor> sofflineVendor = [];
  User? user;

/////////////////////////////////// Clear Variables /////////////////////////////////////////////////////////

  clear() {
    vendors = [];
    searchVendor = [];
    onlineVendor = [];
    offlineVendor = [];
    sonlineVendor = [];
    sofflineVendor = [];
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
      offlineVendor = vendor.where((i) => i.online == 0).toList();
      sonlineVendor = onlineVendor;
      sofflineVendor = offlineVendor;
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
      sofflineVendor = offlineVendor;
      update();
    } else {
      sonlineVendor = onlineVendor
          .where((o) =>
              o.name!.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
      sofflineVendor = offlineVendor
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
      sofflineVendor = offlineVendor;
      update();
    } else {
      sofflineVendor = offlineVendor
          .where((o) =>
              o.name!.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
      update();
    }
  }

//////////////////////////////////// Update Vendors on return Back ////////////////////////////////////////////////////////////

  offlineVendorUpdate() {
    sofflineVendor = offlineVendor;
    update();
  }

  onlineVendorUpdate() {
    sonlineVendor = onlineVendor;
    update();
  }

//////////////////////////////////// filter offline vendors/////////////////////////////////////////////////

  void filterOfflineOrder(String? rating, String? price) {
    if (rating == "Highest to lowest rating") {
      sofflineVendor = offlineVendor;
      sofflineVendor.sort((a, b) => double.parse(b.rating!).compareTo(double.parse(a.rating!)));
      if (price == "Highest price to lowest price") {
        sofflineVendor.sort((a, b) => double.parse(b.service!.onlineaudiovideoPrice!).compareTo(double.parse(a.service!.onlineaudiovideoPrice!)));
      } else if (price == "lowest price to Highest price") {
        sofflineVendor.sort((a, b) => double.parse(a.service!.onlineaudiovideoPrice!).compareTo(double.parse(b.service!.onlineaudiovideoPrice!)));
      }
    } else if (rating == "lowest to Highest rating") {
      sofflineVendor = offlineVendor;
      sofflineVendor.sort((a, b) => double.parse(a.rating!).compareTo(double.parse(b.rating!)));
      if (price == "Highest price to lowest price") {
        sofflineVendor.sort((a, b) => double.parse(b.service!.onlineaudiovideoPrice!).compareTo(double.parse(a.service!.onlineaudiovideoPrice!)));
      } else if (price == "lowest price to Highest price") {
        sofflineVendor.sort((a, b) => double.parse(a.service!.onlineaudiovideoPrice!).compareTo(double.parse(b.service!.onlineaudiovideoPrice!)));
      }
    } else {
      if (price == "Highest price to lowest price") {
        sofflineVendor.sort((a, b) => double.parse(b.service!.onlineaudiovideoPrice!).compareTo(double.parse(a.service!.onlineaudiovideoPrice!))); 
      } else if (price == "lowest price to Highest price") {
        sofflineVendor.sort((a, b) => double.parse(a.service!.onlineaudiovideoPrice!).compareTo(double.parse(b.service!.onlineaudiovideoPrice!)));
      }
    }
    update();
  }

//////////////////////////////////// filter Online Vendors /////////////////////////////////////////////////

  filterOnlineOrder(String? rating, String? price) {
    if (rating == "Highest to lowest rating") {
      sonlineVendor = onlineVendor;
      sonlineVendor.sort((a, b) => double.parse(b.rating!).compareTo(double.parse(a.rating!)));
      if (price == "Highest price to lowest price") {
        sonlineVendor.sort((a, b) => double.parse(b.service!.onlineaudiovideoPrice!).compareTo(double.parse(a.service!.onlineaudiovideoPrice!)));
      } else if (price == "lowest price to Highest price") {
        sonlineVendor.sort((a, b) => double.parse(a.service!.onlineaudiovideoPrice!).compareTo(double.parse(b.service!.onlineaudiovideoPrice!)));
      }
    } else if (rating == "lowest to Highest rating") {
      sonlineVendor = onlineVendor;
      sonlineVendor.sort((a, b) => double.parse(a.rating!).compareTo(double.parse(b.rating!)));
      if (price == "Highest price to lowest price") {
        sonlineVendor.sort((a, b) => double.parse(b.service!.onlineaudiovideoPrice!).compareTo(double.parse(a.service!.onlineaudiovideoPrice!)));
      } else if (price == "lowest price to Highest price") {
        sonlineVendor.sort((a, b) => double.parse(a.service!.onlineaudiovideoPrice!).compareTo(double.parse(b.service!.onlineaudiovideoPrice!)));
      }
    } else {
      if (price == "Highest price to lowest price") {
        sonlineVendor.sort((a, b) => double.parse(b.service!.onlineaudiovideoPrice!).compareTo(double.parse(a.service!.onlineaudiovideoPrice!)));
      } else if (price == "lowest price to Highest price") {
        sonlineVendor.sort((a, b) => double.parse(a.service!.onlineaudiovideoPrice!).compareTo(double.parse(b.service!.onlineaudiovideoPrice!)));
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
}
