import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:translation/api/api.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/models/user.dart';
import 'package:translation/values/string.dart';
import 'package:get_storage/get_storage.dart';

//Enums used to ask user for desired service
enum ServiceType { Instant, Schedule, Document }

enum ScheduleType { AudioVideo, InPerson }

enum DocumentType { Urgent, NotUrgent }

class TranslatorProfileController extends GetxController {
  static TranslatorProfileController instance = Get.find();
  User? user;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  //default types for radio Buttons (change from here)
  ServiceType serviceType = ServiceType.Instant;
  ScheduleType scheduleType = ScheduleType.AudioVideo;
  DocumentType documentType = DocumentType.Urgent;

  // default times to schedule
  String startTime = '';
  String endTime = '';

  //default date for calender
  var selectedDay = DateTime.now().obs;
  var focusedDay = DateTime.now().obs;

//button text for updated date
  updateButtonText(day) {
    selectedDay = day;
  }

  // pages for documents
  int pages = 0;

  //togle schedule type
  toggleplan(ScheduleType value) {
    scheduleType = value;
  }

  //set selected and focused days received from calender
  setSelectedDay(DateTime _selectedDay, DateTime _focusedDay) {
    selectedDay.value = _selectedDay;
    focusedDay.value = _focusedDay;
    update();
  }

  // toggle document type (urgent or non urgent)
  toggledocumentplan(DocumentType value) {
    documentType = value;
  }

  placeOrder() async {
    LoadingHelper.show();
    var url = BASE_URL + 'user/order';
    var data;
    GetStorage box = GetStorage();
    print(box.read('api_token'));
    data = {'api_token': box.read('api_token')!};
    var response = await Api.execute(url: url, data: data);
    LoadingHelper.dismiss();
    // if (!response['error']) {
    //   user = User(response['user']);
    //   nameController.text = user!.username!;
    //   phoneController.text = user!.number!;
    //   emailController.text = user!.email!;
    //   update();
    // } else {
    //   Get.snackbar("Error!", response['error_data'],
    //       snackPosition: SnackPosition.BOTTOM,
    //       backgroundColor: Colors.red,
    //       colorText: Colors.white);
    // }
  }

  /// code to get location
  getlocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    print(
        'latitude: ${_locationData.latitude}, longitude: ${_locationData.longitude}');
  }
}
