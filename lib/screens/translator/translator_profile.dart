import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:translation/static/titletopbar.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:translation/models/vendor.dart';
import 'package:translation/screens/setting/settingcontroller.dart';
import 'package:translation/screens/translator/map.dart';
import 'package:translation/screens/translator/radio_btn.dart';
import 'package:translation/screens/translator/radio_btn2.dart';
import 'package:translation/screens/translator/traling_radio.dart';
import 'package:translation/screens/translator/translator_profile_controller.dart';
import 'package:translation/static/add_remove.dart';
import 'package:translation/static/settime_box.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:translation/static/checkout_button.dart';
import 'package:translation/static/icon_button.dart';
import 'package:translation/static/image.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:translation/static/lang_box.dart';
import 'package:translation/static/profile_detail.dart';
import 'package:translation/static/schedule.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/screens/checkout/checkout.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:translation/values/controllers.dart';
import 'dart:ui' as ui;

class TraslatorProfile extends StatefulWidget {
  const TraslatorProfile({super.key, required this.detail});
  final Vendor? detail;

  @override
  State<TraslatorProfile> createState() => _TraslatorProfileState();
}

class _TraslatorProfileState extends State<TraslatorProfile> {
  SettingController currencycontroller = Get.find();
  GetStorage box = GetStorage();
  String? selectedCurrency;
  vendor() async {
    print('widget.detail!.service!.isAudioVideo');
    print(widget.detail!.service!.isAudioVideo);
    print('widget.detail!.service!.isInperson');
    print(widget.detail!.service!.isInperson);
    print('widget.detail!.service!.isdocument');
    print(widget.detail!.service!.isdocument);
    translatorProfileController.vendors = widget.detail;
    if (widget.detail!.service!.isAudioVideo == true) {
      if (widget.detail!.online == 0) {
        translatorProfileController.serviceType = ServiceType.Schedule;
      } else {
        translatorProfileController.serviceType = ServiceType.Schedule;
      }
    } else if (widget.detail!.service!.isInperson == true) {
      translatorProfileController.serviceType = ServiceType.Schedule;
      translatorProfileController.scheduleType = ScheduleType.InPerson;
      print(translatorProfileController.scheduleType);
    } else if (widget.detail!.service!.isdocument == true) {
      translatorProfileController.serviceType = ServiceType.Document;
    }
    print(translatorProfileController.vendors);
    setState(() {});
  }

  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  TextEditingController pagecontoller = TextEditingController();
  DateTime now = DateTime.now();
  DateTime? nextSixMonths;

  @override
  void initState() {
    nextSixMonths = now.add(Duration(days: 180));
    vendor();
    getfav();
    urgentMaxcount();
    unurgentMaxCount();
    selectedCurrency = box.read('currency');
    super.initState();
  }

  urgentMaxcount() async {
    await translatorProfileController.urgentMaxCount(widget.detail!);
    setState(() {});
  }

  unurgentMaxCount() async {
    await translatorProfileController.unurgentMaxCount(widget.detail!);
    setState(() {});
  }

  getfav() async {
    startTimeController.text = DateFormat.Hm().format(DateTime.now());
    await translatorProfileController.getfavrit(widget.detail!.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ggrey,
      body: SafeArea(
        child: GetBuilder<TranslatorProfileController>(
            builder: (controller) => SingleChildScrollView(
                  child: Column(children: [
                    Stack(
                      children: [
                        TitleTopbar(
                          text: "Details".tr,
                          height: 0.15,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 85, left: 16, right: 16),
                          padding:
                              EdgeInsets.only(right: 20, left: 20, top: 10),
                          decoration: BoxDecoration(
                              color: ggrey,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[500]!,
                                  blurRadius: 2,
                                  offset: Offset(0.00001, 3),
                                ),
                              ]),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  translatorProfileController.favourit == false
                                      ? InkWell(
                                          onTap: () {
                                            translatorProfileController
                                                .addfavorit(widget.detail!);
                                          },
                                          child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: SvgPicture.asset(
                                                  "assets/images/heart.svg",
                                                  height: 28,
                                                  width: 28)))
                                      : InkWell(
                                          onTap: () {
                                            translatorProfileController
                                                .addfavorit(widget.detail!);
                                          },
                                          child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: SvgPicture.asset(
                                                  "assets/images/fav.svg",
                                                  height: 26,
                                                  width: 25))),
                                ],
                              ),
                              ProfileDetail(
                                name: widget.detail!.name,
                                // rating: widget.detail!.rating == null
                                //     ? null
                                //     : double.parse(widget.detail!.rating!),
                                image: widget.detail!.profilePic,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 14),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Languages".tr,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                padding: EdgeInsets.only(top: 8),
                                width: double.infinity,
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.center,
                                  children: [
                                    for (var i = 0;
                                        i < widget.detail!.language!.length;
                                        i++)
                                      LanguageBox(
                                          lang: widget.detail!.language![i]),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Certificates".tr,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 12, bottom: 12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    widget.detail!.certificate == ''
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8, bottom: 8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                    "No certificate uploaded!".tr),
                                              ],
                                            ),
                                          )
                                        : Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: lightblue, width: 1,),
                                              borderRadius:
                                                  BorderRadius.circular(22),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    "assets/images/user.svg"),
                                                InkWell(
                                                  onTap: () {
                                                    Get.to(
                                                      () => FullScreenImagePage(
                                                        imageUrl: widget.detail!
                                                            .certificate!,
                                                      ),
                                                    );
                                                  },
                                                  child: Text(
                                                   ' ' +'view certificate'.tr,
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Book a service'.tr,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                widget.detail!.service!.isAudioVideo == true
                                    ? RadioBtn(
                                        text:' ' + 'Audio/video meeting'.tr,
                                        image:
                                            'assets/images/output-onlinepngtools (11).png',
                                        groupvalue: controller.scheduleType,
                                        value: ScheduleType.AudioVideo,
                                        onChanged: () {
                                          controller.serviceType =
                                              ServiceType.Schedule;
                                          controller.toggleplan(
                                              ScheduleType.AudioVideo);
                                        },
                                      )
                                    : Container(),
                                SizedBox(
                                  height: 10,
                                ),
                                widget.detail!.service!.isInperson! == true
                                    ? RadioBtn(
                                        text: ' ' +'In person meeting'.tr,
                                        image:
                                            'assets/images/output-onlinepngtools (10).png',
                                        groupvalue: controller.scheduleType,
                                        value: ScheduleType.InPerson,
                                        onChanged: () {
                                          controller.serviceType =
                                              ServiceType.Schedule;
                                          controller.toggleplan(
                                              ScheduleType.InPerson);
                                        },
                                      )
                                    : Container(),
                                controller.scheduleType == ScheduleType.InPerson
                                    ? SizedBox(
                                        height: 12,
                                      )
                                    : Container(),
                                controller.scheduleType == ScheduleType.InPerson
                                    ? IconsButton(
                                        title: 'Choose Location'.tr,
                                        icon: Icons.my_location_rounded,
                                        onPressed: () {
                                          // controller.getlocation();
                                          Get.to(
                                              () => DeliveryMap(widget.detail));
                                        })
                                    : Container(),
                                controller.scheduleType ==
                                            ScheduleType.AudioVideo ||
                                        controller.scheduleType ==
                                            ScheduleType.InPerson
                                    ? SizedBox(
                                        height: 10,
                                      )
                                    : Container(),
                                controller.scheduleType ==
                                            ScheduleType.AudioVideo ||
                                        controller.scheduleType ==
                                            ScheduleType.InPerson
                                    ? IconsButton(
                                        title: 'Choose Date'.tr,
                                        icon: Icons.calendar_month,
                                        onPressed: () {
                                          showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Directionality(
                                                textDirection:
                                                    ui.TextDirection.ltr,
                                                child: StatefulBuilder(
                                                  builder: (BuildContext
                                                          context,
                                                      StateSetter setState) {
                                                    // Define a callback function to update the selected date
                                                    void onDateSelected(
                                                        DateTime selectedDay,
                                                        DateTime focusedDay) {
                                                      controller.setSelectedDay(
                                                          selectedDay,
                                                          focusedDay);
                                                      setState(() {});
                                                    }

                                                    return Wrap(
                                                      children: [
                                                        TableCalendar(
                                                          calendarFormat:
                                                              CalendarFormat
                                                                  .month,
                                                          availableCalendarFormats: const {
                                                            CalendarFormat
                                                                .month: 'Month',
                                                            // CalendarFormat.week: 'Week',
                                                          },
                                                          firstDay: now,
                                                          lastDay:
                                                              nextSixMonths!,
                                                          focusedDay: controller
                                                              .focusedDay.value,
                                                          calendarStyle:
                                                              CalendarStyle(
                                                            todayDecoration: BoxDecoration(
                                                                color: greenish
                                                                    .withOpacity(
                                                                        0.5),
                                                                shape: BoxShape
                                                                    .circle),
                                                            selectedDecoration:
                                                                BoxDecoration(
                                                              color:
                                                                  greenish, // Customize the background color of the selected day
                                                              shape: BoxShape
                                                                  .circle, // Customize the shape of the selected day
                                                            ),
                                                            selectedTextStyle:
                                                                TextStyle(
                                                              color:
                                                                  white, // Customize the text color of the selected day
                                                              fontWeight: FontWeight
                                                                  .bold, // Customize the font weight of the selected day
                                                            ),
                                                          ),
                                                          selectedDayPredicate:
                                                              (day) {
                                                            return isSameDay(
                                                                controller
                                                                    .selectedDay
                                                                    .value,
                                                                day);
                                                          },
                                                          onDaySelected:
                                                              onDateSelected,
                                                        ),
                                                        Center(
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 30,
                                                                    top: 16),
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.8,
                                                            child:
                                                                ElevatedButton(
                                                              onPressed: () {
                                                                // Call the callback to update the button text
                                                                controller.updateButtonText(
                                                                    controller
                                                                        .selectedDay);
                                                                Navigator.of(
                                                                        context)
                                                                    .pop(); // Close the bottom sheet
                                                              },
                                                              child: Text(
                                                                  'Done'.tr),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      )
                                    : SizedBox(),
                                controller.scheduleType ==
                                            ScheduleType.AudioVideo ||
                                        controller.scheduleType ==
                                            ScheduleType.InPerson
                                    ? SizedBox(
                                        height: 12,
                                      )
                                    : Container(),
                                controller.scheduleType ==
                                            ScheduleType.AudioVideo ||
                                        controller.scheduleType ==
                                            ScheduleType.InPerson
                                    ? Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        padding:
                                            EdgeInsets.only(bottom: 7, top: 7),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey[500]!,
                                              blurRadius: 5,
                                              offset: Offset(0.00001, 1),
                                            ),
                                          ],
                                          color: Colors.white,
                                          border: Border.all(
                                              color: lightblue, width: 1.2),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.watch_later_rounded),
                                                Text(
                                                  'Set Time'.tr,
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 12),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Scheduleinput(
                                                    text: 'Start Time'.tr,
                                                    controller:
                                                        startTimeController,
                                                    onpressed: () {
                                                      DatePicker.showTimePicker(
                                                          context,
                                                          showTitleActions:
                                                              true,
                                                          showSecondsColumn:
                                                              false,
                                                          locale: box.read(
                                                                      'locale') !=
                                                                  'ar'
                                                              ? LocaleType.en
                                                              : LocaleType.ar,
                                                          onChanged: (val) {
                                                        var end = val.add(
                                                            Duration(
                                                                minutes: 1));
                                                        var time =
                                                            DateFormat.Hm()
                                                                .format(val);
                                                        var endTime =
                                                            DateFormat.Hm()
                                                                .format(end);
                                                        startTimeController
                                                            .text = time;
                                                        endTimeController.text =
                                                            endTime;
                                                        controller.startTime =
                                                            time;
                                                        controller.endTime =
                                                            endTime;
                                                        translatorProfileController
                                                            .calTotalTime(
                                                                widget.detail!);
                                                        setState(() {});
                                                      }, onConfirm: (val) {
                                                        var end = val.add(
                                                            Duration(
                                                                minutes: 1));
                                                        var time =
                                                            DateFormat.Hm()
                                                                .format(val);
                                                        var endTime =
                                                            DateFormat.Hm()
                                                                .format(end);
                                                        startTimeController
                                                            .text = time;
                                                        endTimeController.text =
                                                            endTime;
                                                        controller.startTime =
                                                            time;
                                                        controller.endTime =
                                                            endTime;
                                                        translatorProfileController
                                                            .calTotalTime(
                                                                widget.detail!);
                                                        setState(() {});
                                                      },
                                                          currentTime:
                                                              DateTime.now());
                                                    },
                                                    hint: '9:00',
                                                    fontSize: 18.0,
                                                  ),
                                                  Text("To".tr),
                                                  Scheduleinput(
                                                    text: 'End Time'.tr,
                                                    controller:
                                                        endTimeController,
                                                    onpressed: () {
                                                      DatePicker.showTimePicker(
                                                          context,
                                                          showTitleActions:
                                                              true,
                                                          showSecondsColumn:
                                                              false,
                                                          onConfirm: (val) {
                                                        var end =
                                                            DateFormat.Hm()
                                                                .format(val);
                                                        endTimeController.text =
                                                            end;
                                                        controller.endTime =
                                                            end;
                                                        translatorProfileController
                                                            .calTotalTime(
                                                                widget.detail!);
                                                        setState(() {});
                                                      }, onChanged: (val) {
                                                        var end =
                                                            DateFormat.Hm()
                                                                .format(val);
                                                        endTimeController.text =
                                                            end;
                                                        controller.endTime =
                                                            end;
                                                        translatorProfileController
                                                            .calTotalTime(
                                                                widget.detail!);
                                                        setState(() {});
                                                      },
                                                          currentTime:
                                                              DateTime.now());
                                                    },
                                                    hint: '9:30',
                                                    fontSize: 18.0,
                                                    enabled:
                                                        controller.startTime ==
                                                                ''
                                                            ? false
                                                            : true,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox()
                              ],
                            ),
                            // : Container(),

                            SizedBox(
                              height: 10,
                            ),
                            widget.detail!.service!.isdocument! == true
                                ? RadioBtn(
                                    text: 'Document Type'.tr,
                                    image: 'assets/images/Documents.png',
                                    groupvalue: controller.serviceType,
                                    value: ServiceType.Document,
                                    onChanged: () {
                                      print(ScheduleType);
                                      setState(() {
                                        controller.serviceType =
                                            ServiceType.Document;
                                        controller.resetInstant();
                                      });
                                    },
                                  )
                                : Container(),

                            controller.serviceType == ServiceType.Document
                                ? Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 59,right: 20),
                                        child: Column(
                                          children: [
                                            RadioBtn2(
                                              text: 'Urgent Document'.tr,
                                              groupvalue:
                                                  controller.documentType,
                                              value: DocumentType.Urgent,
                                              onChanged: () {
                                                controller.toggledocumentplan(
                                                    DocumentType.Urgent);
                                                translatorProfileController
                                                    .resetvalue();
                                              },
                                            ),
                                            RadioBtn2(
                                              text: 'No Urgent Document'.tr,
                                              groupvalue:
                                                  controller.documentType,
                                              value: DocumentType.NotUrgent,
                                              onChanged: () {
                                                controller.toggledocumentplan(
                                                    DocumentType.NotUrgent);
                                                translatorProfileController
                                                    .resetvalue();
                                              },
                                            ),
                                          ],
                                        ),
                                      ),

                                      InkWell(
                                        onTap: () {
                                          translatorProfileController
                                              .picksinglefile();
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.49,
                                                    padding: EdgeInsets.only(
                                                        top: 6,
                                                        bottom: 6,
                                                        left: 9),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: greenish),
                                                        color: greenish,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20))),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.attach_file,
                                                          color: white,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8,
                                                                  right: 8),
                                                          child: Text(
                                                            "Attach File".tr,
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: white,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      translatorProfileController.file != null
                                          ? Padding(
                                              padding: EdgeInsets.only(
                                                  top: 8, bottom: 8),
                                              child: Text(
                                                  translatorProfileController
                                                      .file
                                                      .toString()),
                                            )
                                          : Container(),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10,right: 15),
                                        child: Row(
                                          children: [
                                            Text(
                                              "       How many pages are in this file ?  ".tr
                                                  .tr,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            AutoSizeTextField(
                                              controller: pagecontoller,
                                              fullwidth: false,
                                              style: TextStyle(fontSize: 18),
                                              maxLines: 1,
                                              minWidth: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2,
                                              decoration: InputDecoration(
                                                suffixIcon: InkWell(
                                                  onTap: () {
                                                    translatorProfileController
                                                            .pages =
                                                        int.parse(
                                                            pagecontoller.text);
                                                    translatorProfileController
                                                        .dayscalculate(
                                                            widget.detail!);
                                                    translatorProfileController
                                                        .documentprice(
                                                            widget.detail!,
                                                            context);
                                                    FocusManager
                                                        .instance.primaryFocus!
                                                        .unfocus();
                                                    // profileController.EditText();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 8.0),
                                                    child: Icon(
                                                      Icons.check,
                                                      color: greenish,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12, bottom: 12),
                                        child: Column(
                                          children: [
                                            Text(
                                              "The Documents will be delivered in     "
                                                      .tr +
                                                  " ",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              translatorProfileController.days
                                                      .toString() +
                                                  ' ' +
                                                  "days".tr,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: greenish,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // FreeItemInput(
                                      //   padding: false,
                                      //   controller: translatorProfileController
                                      //       .descriptionController,
                                      // ),
                                    ],
                                  )
                                : Container(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8, bottom: 30),
                              child: CheckOutButton(
                                title: 'Checkout'.tr,
                                price: controller.totalAmount.toString(),
                                sreenRatio: 0.9,
                                currencyname: selectedCurrency != null
                                    ? selectedCurrency
                                    : "AED ",
                                onPressed: () {
                                  checkoutController.clear();
                                  if (controller.serviceType ==
                                      ServiceType.Document) {
                                    if (controller.totalAmount <= 0) {
                                      Get.snackbar(
                                          "Please fill all required details".tr,
                                          '',
                                          // "Make sure the page selected by you is within the range of the translator. You may check by ensuring that your selected pages are deliverable in at least one day.",
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor: Colors.red,
                                          colorText: Colors.white);
                                      return;
                                    }
                                    translatorProfileController.CheckoutAmount =
                                        controller.totalAmount;
                                    setState(() {});
                                    if (translatorProfileController.file ==
                                        null) {
                                      Get.snackbar("Please Attach File.".tr, "",
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor: Colors.red,
                                          colorText: Colors.white);
                                      return;
                                    }
                                    Get.to(() => Checkout_screen(
                                          totalAmount: controller.CheckoutAmount
                                              .toString(),
                                        ));
                                  } else {
                                    controller.checkavailability(
                                        widget.detail!, context);
                                  }
                                },
                                color: greenish,
                                textcolor: Colors.white,
                                buttonWidth: 0.95,
                              ),
                            )
                          ],
                        ))
                  ]),
                )),
      ),
    );
  }

  update(context) {
    Alert(
      style: AlertStyle(
        titleStyle: TextStyle(fontSize: 25),
      ),
      context: context,
      title: "Sorry! Interpreter not within your range. ",
      image: SvgPicture.asset(
        "assets/images/group.svg", // replace with your logo image path
        width: 60,
        height: 60,
      ),
      buttons: [
        DialogButton(
          radius: BorderRadius.all(
            Radius.circular(12),
          ),
          height: 60,
          child: Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: greenish,
        ),
      ],
    ).show();
  }
}

/////////////Interpretation not found
//  showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         contentPadding: EdgeInsets.zero,
//                         content: Container(
//                           width: 313,
//                           height: 275,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Colors.white,
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.stretch,
//                             children: [
//                               Container(
//                                 height: 80,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.vertical(
//                                       top: Radius.circular(10)),
//                                 ),
//                                 child: Center(
//                                   child: SvgPicture.asset(
//                                     "assets/images/group.svg", // replace with your logo image path
//                                     width: 60,
//                                     height: 60,
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 16),
//                                 child: Text(
//                                   'Sorry! Interpreter not within your range.',
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Align(
//                                   alignment: Alignment.bottomCenter,
//                                   child: ElevatedButton(
//                                     onPressed: () {
//                                       Navigator.pop(context);
//                                     },
//                                     child: Text('OK'),
//                                     style: ButtonStyle(
//                                       backgroundColor:
//                                           MaterialStateProperty.all<Color>(
//                                               greenish),
//                                       fixedSize: MaterialStateProperty.all(
//                                           Size(248, 64)),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );

//////Sorry Session Booked
///  showDialog(
//   context: context,
//   builder: (BuildContext context) {
//     return AlertDialog(
//       title: Center(
//         child: SvgPicture.asset(
//           "assets/images/group.svg", // replace with your logo image path
//           width: 60,
//           height: 60,
//         ),
//       ),
//       content: Container(
//         width: 215,
//         height: 78,
//         child: Center(
//           child: Text(
//             'Sorry! Session is booked, please try other available timings.',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontFamily: 'Nunito Sans',
//               fontWeight: FontWeight.bold,
//               fontSize: 19,
//               color: Color.fromRGBO(0, 0, 0, 0.63),
//               height: 1.37,
//             ),
//           ),
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Expanded(
//             child: Align(
//               alignment: Alignment.bottomCenter,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('OK'),
//                 style: ButtonStyle(
//                   backgroundColor:
//                       MaterialStateProperty.all<Color>(
//                           greenish),
//                   fixedSize: MaterialStateProperty.all(
//                       Size(248, 64)),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   },
// );
