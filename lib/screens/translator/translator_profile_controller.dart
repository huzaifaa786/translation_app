import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:translation/api/api.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/models/user.dart';
import 'package:translation/models/vendor.dart';
import 'package:translation/screens/checkout/checkout.dart';
import 'package:translation/screens/order_confirm.dart/cardAdded.dart';
import 'package:translation/values/string.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

//Enums used to ask user for desired service
enum ServiceType { Instant, Schedule, Document }

enum ScheduleType { AudioVideo, InPerson }

enum DocumentType { Urgent, NotUrgent }

enum InstantType { audio, video }

class TranslatorProfileController extends GetxController {
  static TranslatorProfileController instance = Get.find();
  Vendor? vendors;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  //default types for radio Buttons (change from here)
  ServiceType serviceType = ServiceType.Instant;
  ScheduleType scheduleType = ScheduleType.AudioVideo;
  DocumentType documentType = DocumentType.Urgent;
  InstantType instantType = InstantType.audio;

  // default times for instant

  String instantTime = ''.obs.toString();

  // default times to schedule
  String startTime = '';
  String endTime = '';
  int totalAmount = 0.obs.toInt();
  int duration = 0.obs.toInt();

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
    update();
  }

  // reset instant value
  resetInstant() {
    instantTime = ''.obs.toString();
    totalAmount = 0.obs.toInt();
    instantType = InstantType.audio;
    update();
  }

  // get amount by slot type
  setAmountBySlot(
      int hour, int minutes, String time, Vendor vendor, int durattion) {
    totalAmount =
        ((hour * 2 + (minutes / 30)) * int.parse(vendor.service!.audiovideo!))
            .toInt();
    instantTime = time;

    duration = durattion;
    startTime = DateTime.now().toString();
    endTime =
        DateTime.now().add(Duration(hours: 0, minutes: duration)).toString();

    update();
  }

  calTotalTime(Vendor vendor) {
    DateTime start = DateFormat('d-M-yyyy HH:mm').parse(
        '${selectedDay.value.day}-${selectedDay.value.month}-${selectedDay.value.year} $startTime');
    DateTime end = DateFormat('d-M-yyyy HH:mm').parse(
        '${selectedDay.value.day}-${selectedDay.value.month}-${selectedDay.value.year} $endTime');

    int differenceInMinutes = end.difference(start).inMinutes;

    print(differenceInMinutes);
    duration = differenceInMinutes;
    print(duration);
    int numberOfSlots = (differenceInMinutes ~/ 30);

    print('Number of slots: $numberOfSlots');
    totalAmount = numberOfSlots * int.parse(vendor.service!.audiovideo!);
    print('totalAmount: $totalAmount');
    update();
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
    update();
  }

  placeOrder(vendor) async {
    LoadingHelper.show();
    var url = BASE_URL + 'user/order';
    var data;
    GetStorage box = GetStorage();
    var servicetype = serviceType == ServiceType.Instant
        ? 'instant'
        : serviceType == ServiceType.Schedule
            ? 'schedule'
            : 'document';
    data = {
      'api_token': box.read('api_token')!,
      'servicetype': servicetype,
      'vendor_id': vendor.id.toString(),
      'price': totalAmount.toString(),
      'duration': duration,
      'date': DateTime.now().toString(),
      'starttime': startTime,
      'endtime': endTime,
      'meetingtype': instantType == InstantType.audio ? 'audio' : 'video',
      'scheduletype':
          scheduleType == ScheduleType.AudioVideo ? 'audio/video' : 'inperson',
    };
    var response = await Api.execute(url: url, data: data);
    LoadingHelper.dismiss();
    if (!response['error']) {
      Get.offAll(() => CardAdded_Screen());
      update();
    } else {
      Get.snackbar("Error!", response['error_data'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
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

  checkavailability(Vendor vendor) async {
    if (totalAmount <= 0) {
      Get.snackbar("Error!", "Order amount can't be zero",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }
    vendors = vendor;
    LoadingHelper.show();
    var url = BASE_URL + 'order/checkAvailability';
    // GetStorage box = GetStorage();
    // DateTime a =selectedDay.value;
    String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDay.value);
    print(formattedDate);
    var data = {
      'vendor_id': vendor.id.toString(),
      'date': formattedDate,
      'starttime': startTime,
      'endtime': endTime,
    };
    var response = await Api.execute(url: url, data: data);
    print(response);
    if (!response["error"]) {
      // placeOrder(vendor);
      Get.to(() => Checkout_screen());
      LoadingHelper.dismiss();
    } else {
      LoadingHelper.dismiss();
      Get.snackbar("Error!", response['error_data'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
    LoadingHelper.dismiss();

    update();
  }
}
