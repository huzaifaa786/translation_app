import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:translation/api/api.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/models/vendor.dart';
import 'package:translation/screens/checkout/checkout.dart';
import 'package:translation/screens/order_confirm.dart/cardAdded.dart';
import 'package:translation/values/colors.dart';
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
  LatLng? selectedLocation;
  RxBool? fav = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
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
    startTime = '';
    endTime = '';
    totalAmount = 0;
    update();
  }

  // reset instant value
  resetInstant() {
    instantTime = ''.obs.toString();
    totalAmount = 0.obs.toInt();
    pages = 0;
    instantType = InstantType.audio;
    scheduleType = ScheduleType.AudioVideo;
    documentType = DocumentType.Urgent;
    selectedLocation = null;
    startTime = '';
    endTime = '';
    update();
  }

  resetvalue() {
    totalAmount = 0.obs.toInt();
    pages = 0;
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

  documentprice(Vendor vendor) {
    if (documentType == DocumentType.Urgent) {
      totalAmount = pages * int.parse(vendor.service!.urgentprice.toString());
    } else {
      totalAmount = pages * int.parse(vendor.service!.unurgentprice.toString());
    }
  }

  File? file;
  Future<void> picksinglefile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      file = File(result.files.single.path!);
    } else {
      // User canceled the picker
    }
  }

  calTotalTime(Vendor vendor) {
    if (scheduleType == ScheduleType.InPerson) {
      DateTime start = DateFormat('d-M-yyyy HH:mm').parse(
          '${selectedDay.value.day}-${selectedDay.value.month}-${selectedDay.value.year} $startTime');
      DateTime end = DateFormat('d-M-yyyy HH:mm').parse(
          '${selectedDay.value.day}-${selectedDay.value.month}-${selectedDay.value.year} $endTime');

      int differenceInMinutes = end.difference(start).inMinutes;

      print(differenceInMinutes);
      duration = differenceInMinutes;
      print(duration);
      double numberOfSlots = (differenceInMinutes / 30);
      print('Number of slots: $numberOfSlots');
      double amount = numberOfSlots * int.parse(vendor.service!.inperson!);
      if (amount <= 0) {
        totalAmount = 0;
        Get.snackbar('Invalid Time Format!',
            'End time must be greater then Start time, And less then 00:00',
            snackPosition: SnackPosition.BOTTOM,
            colorText: white,
            backgroundColor: Colors.red);
      } else {
        String totalSlotAmount = amount.toStringAsFixed(0);
        totalAmount = int.parse(totalSlotAmount);
        print('totalAmount: $totalAmount');
      }
      update();
    } else {
      print('vendor.service!.audiovideo!');
      print(vendor.service!.audiovideo!);
      print('vendor.service!.inperson!');
      print(vendor.service!.inperson!);
      DateTime start = DateFormat('d-M-yyyy HH:mm').parse(
          '${selectedDay.value.day}-${selectedDay.value.month}-${selectedDay.value.year} $startTime');
      DateTime end = DateFormat('d-M-yyyy HH:mm').parse(
          '${selectedDay.value.day}-${selectedDay.value.month}-${selectedDay.value.year} $endTime');

      int differenceInMinutes = end.difference(start).inMinutes;

      print(differenceInMinutes);
      duration = differenceInMinutes;
      print(duration);
      double numberOfSlots = (differenceInMinutes / 30);
      print('Number of slots: $numberOfSlots');
      double amount = numberOfSlots * int.parse(vendor.service!.audiovideo!);
      if (amount <= 0) {
        totalAmount = 0;
        Get.snackbar('Invalid Time Format!',
            'End time must be greater then Start time, And less then 00:00',
            snackPosition: SnackPosition.BOTTOM,
            colorText: white,
            backgroundColor: Colors.red);
      } else {
        String totalSlotAmount = amount.toStringAsFixed(0);
        totalAmount = int.parse(totalSlotAmount);
        print('totalAmount: $totalAmount');
      }
      update();
    }
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
    print('dfffffffffffffffffffffffffffff');
    print(vendor);
    LoadingHelper.show();
    var url = BASE_URL + 'user/order';
    var data;
    GetStorage box = GetStorage();
    var servicetype = serviceType == ServiceType.Instant
        ? 'instant'
        : serviceType == ServiceType.Schedule
            ? 'schedule'
            : 'document';
    var response;
    if (serviceType == ServiceType.Document) {
      String fileName = file!.path.split('/').last;

      data = dio.FormData.fromMap({
        "file":
            await dio.MultipartFile.fromFile(file!.path, filename: fileName),
        'api_token': box.read('api_token')!,
        'servicetype': servicetype,
        'vendor_id': vendor.id.toString(),
        'price': totalAmount.toString(),
        'duration': duration,
        'date': DateTime.now().toString(),
        'starttime': startTime,
        'endtime': endTime,
        'meetingtype': instantType == InstantType.audio ? 'audio' : 'video',
        'scheduletype': scheduleType == ScheduleType.AudioVideo
            ? 'audio/video'
            : 'inperson',
        'documenttype': documentType,
        'pages': pages,
        'description': descriptionController
      });
      response = await Api.execute(url: url, data: data, image: true);
    } else {
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
        'scheduletype': scheduleType == ScheduleType.AudioVideo
            ? 'audio/video'
            : 'inperson',
      };
      response = await Api.execute(url: url, data: data);
    }

    LoadingHelper.dismiss();
    print(response);
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

  InpersonplaceOrder(vendor) async {
    print('selectedLocation!.latitude');
    print(selectedLocation!.latitude);
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
      'scheduletype':
          scheduleType == ScheduleType.AudioVideo ? 'audio/video' : 'inperson',
      'latitude': selectedLocation!.latitude,
      'longitude': selectedLocation!.longitude,
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

  convertFile() async {
    String fileName = file!.path.split('/').last;
    var MultipartFile =
        await dio.MultipartFile.fromFile(file!.path, filename: fileName);
    return MultipartFile;
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
      Get.to(() => Checkout_screen(
            totalAmount: totalAmount.toString(),
          ));
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

  addfavorit(Vendor vendor) async {
    LoadingHelper.show();
    var url = BASE_URL + 'add/favorities';
    GetStorage box = GetStorage();

    var data = {
      'vendor_id': vendor.id.toString(),
      'api_token': box.read('api_token')!,
    };
    var response = await Api.execute(url: url, data: data);
    print(response);
    LoadingHelper.dismiss();

    update();
  }

  clear() {
    selectedLocation = null;
    serviceType = ServiceType.Instant;
    scheduleType = ScheduleType.AudioVideo;
    documentType = DocumentType.Urgent;
    instantType = InstantType.audio;
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    descriptionController.clear();
    instantTime = ''.obs.toString();
    startTime = '';
    endTime = '';
    totalAmount = 0.obs.toInt();
    duration = 0.obs.toInt();
    selectedDay = DateTime.now().obs;
    focusedDay = DateTime.now().obs;
    pages = 0;
    file = null;
  }
}
