import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart' as dio;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:translation/api/api.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/models/unurgent.dart';
import 'package:translation/models/urgent.dart';
import 'package:translation/models/vendor.dart';
import 'package:translation/screens/checkout/checkout.dart';
import 'package:translation/screens/order_confirm.dart/cardAdded.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/values/controllers.dart';
import 'package:translation/values/string.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

//Enums used to ask user for desired service
enum ServiceType { Schedule, Document }

enum ScheduleType { AudioVideo, InPerson, DocumentType }

enum DocumentType { Urgent, NotUrgent }

// enum InstantType { audio, video }

List<Urgent> urgents = [];
List<Unurgent> unurgents = [];

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
  ServiceType serviceType = ServiceType.Schedule;
  ScheduleType scheduleType = ScheduleType.AudioVideo;
  DocumentType documentType = DocumentType.Urgent;
  // InstantType instantType = InstantType.audio;

  // default times for instant

  String instantTime = ''.obs.toString();

  // default times to schedule
  String startTime = '';
  String endTime = '';
  int totalAmount = 0.obs.toInt();
  int CheckoutAmount = 0.obs.toInt();
  int duration = 0.obs.toInt();

  //default date for calender
  var selectedDay = DateTime.now().obs;
  var focusedDay = DateTime.now().obs;

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

  toggleplan1(DocumentType value) {
    documentType = value;

    totalAmount = 0;
    update();
  }

  // reset instant value
  resetInstant() {
    instantTime = ''.obs.toString();
    totalAmount = 0.obs.toInt();
    pages = 0;
    // instantType = InstantType.audio;
    scheduleType = ScheduleType.AudioVideo;
    documentType = DocumentType.Urgent;
    selectedLocation = null;
    startTime = '';
    endTime = '';
    days = '0';
    update();
  }

  resetvalue() {
    totalAmount = 0.obs.toInt();
    pages = 0;
  }

  // get amount by slot type
  setAmountBySlot(
      int hour, int minutes, String time, Vendor vendor, int durattion) {
    totalAmount = ((hour * 2 + (minutes / 30)) *
            int.parse(vendor.service!.onlineaudiovideoPrice!))
        .toInt();
    instantTime = time;

    duration = durattion;
    startTime = DateTime.now().toString();
    endTime =
        DateTime.now().add(Duration(hours: 0, minutes: duration)).toString();

    update();
  }

  documentprice(Vendor vendor, context) {
    print(days);
    if (days != '0') {
      if (documentType == DocumentType.Urgent) {
        totalAmount = pages * int.parse(vendor.service!.urgentprice.toString());
      } else {
        totalAmount =
            pages * int.parse(vendor.service!.unurgentprice.toString());
      }
    } else {
      totalAmount = 0;
      Get.snackbar(
          'Pages exceed the maximum amount of pages set by translator'.tr, '',
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
          colorText: white,
          snackPosition: SnackPosition.BOTTOM);
      pageAlert(context);
    }
    update();
  }

  File? file = File('');
  Future<void> picksinglefile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      file = File(result.files.single.path!);
      update();
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
        Get.snackbar('', 'End time must be greater than  starting time.'.tr,
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
        Get.snackbar('', 'End time must be greater than  starting time.'.tr,
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
    print('fffffffffffffffffff');
    print(selectedDay.value);
  }

  // toggle document type (urgent or non urgent)
  toggledocumentplan(DocumentType value) {
    documentType = value;
    update();
  }

  // checkDuration() {
  //   print(startTime);
  //   print(endTime);
  //   final starttime = DateFormat.Hm().parse(startTime);
  //   final endtime = DateFormat.Hm().parse(endTime);

  //   final duration = endtime.difference(starttime);
  //   final durationInMinutes = duration.inMinutes;

  //   print('Duration: $durationInMinutes minutes');
  //   return durationInMinutes;
  // }

  placeOrder(vendor) async {
    //  if(serviceType == ServiceType.Schedule)
    LoadingHelper.show();
    var url = BASE_URL + 'user/order';
    var data;
    GetStorage box = GetStorage();
    var servicetype =
        serviceType == ServiceType.Schedule ? 'schedule' : 'document';

    var response;
    if (serviceType == ServiceType.Document) {
      String fileName = file!.path.split('/').last;

      data = dio.FormData.fromMap({
        "file":
            await dio.MultipartFile.fromFile(file!.path, filename: fileName),
        'api_token': box.read('api_token')!,
        'servicetype': ScheduleType,
        'vendor_id': vendor.id.toString(),
        'price': CheckoutAmount.toString(),
        'duration': duration,
        'date': DateTime.now().toString(),
        'starttime': startTime,
        'endtime': endTime,
        'meetingtype': 'audio',
        // 'meetingtype': instantType == InstantType.audio ? 'audio' : 'video',
        'scheduletype': ScheduleType,
         
        'documenttype': documentType,
        'pages': pages,
        'description': descriptionController.text.toString()
      });
      print(data);
      // response = await Api.execute(url: url, data: data, image: true);
    } else {
      data = {
        'api_token': box.read('api_token')!,
        'servicetype': servicetype,
        'vendor_id': vendor.id.toString(),
        'price': CheckoutAmount.toString(),
        'duration': duration,
        'date': serviceType == ServiceType.Schedule
            ? translatorProfileController.selectedDay.value.toString()
            : DateTime.now().toString(),
        'starttime': startTime,
        'endtime': endTime,
        'meetingtype': 'audio',
        'scheduletype': scheduleType == ScheduleType.AudioVideo
            ? 'audio/video'
            : 'inperson',
            
      };
      print('ffffffffffffffffffffffffffffffff');
      print(data);
      // response = await Api.execute(url: url, data: data);
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
    var servicetype =
        serviceType == ServiceType.Schedule ? 'schedule' : 'document';
    data = {
      'api_token': box.read('api_token')!,
      'servicetype': servicetype,
      'vendor_id': vendor.id.toString(),
      'price': CheckoutAmount.toString(),
      'duration': duration,
      'date': translatorProfileController.selectedDay.value.toString(),
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

    LocationData _locationData;

    _locationData = await location.getLocation();
    print('gggggggggggggggggggggggggggg');
    print(
        'latitude: ${_locationData.latitude}, longitude: ${_locationData.longitude}');
  }

  checkavailability(Vendor vendor, BuildContext context) async {
    if (totalAmount <= 0) {
      Get.snackbar("", "Please fill all required details".tr,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }
    CheckoutAmount = totalAmount;
    // var duration = checkDuration();
    // if (duration != 30) {
    //   Get.snackbar("Error!", "Duration must be 30 minutes",
    //       snackPosition: SnackPosition.BOTTOM,
    //       backgroundColor: Colors.red,
    //       colorText: Colors.white);
    //   return;
    // }

    vendors = vendor;
    LoadingHelper.show();
    var url = BASE_URL + 'order/checkAvailability';
    String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDay.value);
    print('formattedDate');

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
      Get.to(() => Checkout_screen(
            totalAmount: CheckoutAmount.toString(),
          ));
      LoadingHelper.dismiss();
    } else {
      LoadingHelper.dismiss();
      Get.snackbar("Timings are booked, please try other time".tr, "",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      errorAlert(context);
    }
    LoadingHelper.dismiss();

    update();
  }

  addfavorit(Vendor vendor) async {
    var url = BASE_URL + 'add/favorities';
    GetStorage box = GetStorage();

    var data = {
      'vendor_id': vendor.id.toString(),
      'api_token': box.read('api_token')!,
    };
    var response = await Api.execute(url: url, data: data);
    favourit = response['favourit'];
    print(response);

    update();
  }

  clear() {
    selectedLocation = null;
    serviceType = ServiceType.Schedule;
    scheduleType = ScheduleType.AudioVideo;
    documentType = DocumentType.Urgent;
    // instantType = InstantType.audio;
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
    days = '0';
  }

  bool? favourit;

  getfavrit(id) async {
    LoadingHelper.show();
    var url = BASE_URL + 'check/favorities';
    GetStorage box = GetStorage();

    print(box.read('api_token'));
    var data = {'id': id, 'api_token': box.read('api_token')};
    var response = await Api.execute(url: url, data: data);
    print(response);
    LoadingHelper.dismiss();
    favourit = response['favourit'];
  }

  String? days = '0';

  int maxPage = 0;
  int umaxpage = 0;
  urgentMaxCount(Vendor vendor) {
    urgents = [];
    print(vendor.service!.urgent);
    if (vendor.service!.urgent!.isNotEmpty) {
      for (var van in vendor.service!.urgent!) {
        urgents.add(Urgent(van));
      }
      maxPage = urgents.map((van) => int.parse(van.maxpage!)).reduce(
          (maxPage, currentMax) => maxPage > currentMax ? maxPage : currentMax);
      update();
    }
  }

  unurgentMaxCount(Vendor vendor) {
    unurgents = [];
    if (vendor.service!.unurgent!.isNotEmpty) {
      for (var van in vendor.service!.unurgent!) {
        unurgents.add(Unurgent(van));
      }
      umaxpage = unurgents.map((van) => int.parse(van.maxpage!)).reduce(
          (umaxpage, currentMax) =>
              umaxpage > currentMax ? umaxpage : currentMax);
      update();
    }
  }

  dayscalculate(Vendor vendor) {
    if (documentType == DocumentType.Urgent) {
      urgents = [];
      for (var van in vendor.service!.urgent!) {
        urgents.add(Urgent(van));
      }
      print(urgents);

      try {
        Urgent totalDay = urgents.firstWhere((element) =>
            int.parse(element.minpage!) <= pages &&
            int.parse(element.maxpage!) >= pages);
        days = totalDay.day;
        update();
      } catch (e) {
        days = '0';
        update();
        print('Error: Data is not within the specified range.');
      }
    } else {
      for (var van in vendor.service!.unurgent!) {
        unurgents.add(Unurgent(van));
      }
      try {
        Unurgent totalDay = unurgents.firstWhere((element) =>
            int.parse(element.minpage!) <= pages &&
            int.parse(element.maxpage!) >= pages);
        days = totalDay.day;
        update();
      } catch (e) {
        days = '0';
        update();
        print('Error: Data is not within the specified range.');
      }
    }
  }

  List<dynamic>? mini = [];
  int? minpage;
  minVal(Vendor venodr) {
    mini = [];
    mini = venodr.service!.urgent;
    int minimum = mini!.map((item) => (int.parse(item["minpage"]))).reduce(min);
    pages = minimum;
    minpage = minimum;
    print(pages);
    update();
  }
}

void errorAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: 350,
          height: 150,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                "assets/images/High Importance.png",
                width: 60,
                height: 60,
              ),
              SizedBox(height: 20),
              Text(
                "Timings are booked please find other\n timings",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    },
  );
}

void pageAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: 350,
          height: 150,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                "assets/images/High Importance.png",
                width: 60,
                height: 60,
              ),
              SizedBox(height: 20),
              Text(
                "The amount of pages exceeds the\n translator’s limits",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    },
  );
}
