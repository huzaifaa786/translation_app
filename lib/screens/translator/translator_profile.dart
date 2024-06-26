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
    selectedCurrency = box.read('selectedCurrency');
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
      backgroundColor: white,
      body: SafeArea(
        child: GetBuilder<TranslatorProfileController>(
          builder: (controller) => SingleChildScrollView(
            child: Column(children: [
              Stack(
                children: [
                  TitleTopbar(
                    text: "Details".tr,
                    height: 0.1 / 0.5,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 85, left: 16, right: 16),
                    // height: MediaQuery.of(context).size.height * 0.89,
                    padding: EdgeInsets.only(right: 20, left: 20),
                    decoration: BoxDecoration(color: Colors.grey.shade200),
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ProfileDetail(
                              name: widget.detail!.name,
                              rating: widget.detail!.rating == null
                                  ? null
                                  : double.parse(widget.detail!.rating!),
                              image: widget.detail!.profilePic,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
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
                            Column(
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
                                            Text("No certificate uploaded!"),
                                          ],
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15, bottom: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                                "assets/images/certificate.svg"),
                                            InkWell(
                                              onTap: () {
                                                Get.to(
                                                  () => FullScreenImagePage(
                                                    imageUrl: widget
                                                        .detail!.certificate!,
                                                  ),
                                                );
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 12, right: 12),
                                                child: Text(
                                                  widget.detail!
                                                      .certificate_name!,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "About".tr,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            widget.detail!.aboutEnglish == ''
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("About Empty."),
                                      ],
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15.0, bottom: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.80,
                                          child: Text(
                                            box.read('locale') != 'ar'
                                                ? widget.detail!.aboutEnglish!
                                                : widget.detail!.aboutArabic!,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            // widget.detail!.service!.isAudioVideo! == true
                            //     ? widget.detail!.online! == 1
                            //         ? TralingRadioBtn(
                            //             text: 'instant'.tr,
                            //             isSelected: controller.serviceType ==
                            //                 ServiceType.Instant,
                            //             ontap: () {
                            //               setState(() {
                            //                 controller.serviceType =
                            //                     ServiceType.Instant;
                            //                 controller.resetInstant();
                            //               });
                            //             },
                            //           )
                            //         : Text('')
                            //     : Container(),
                            // controller.serviceType == ServiceType.Instant
                            //     ? Column(
                            //         children: [
                            //           Container(
                            //             width:
                            //                 MediaQuery.of(context).size.width,
                            //             height: 48,
                            //             margin: EdgeInsets.only(top: 8),
                            //             decoration: BoxDecoration(
                            //                 color: Color.fromARGB(
                            //                     255, 255, 255, 255),
                            //                 borderRadius:
                            //                     BorderRadius.circular(8),
                            //                 border:
                            //                     Border.all(color: greenish)),
                            //             child: Row(
                            //               mainAxisAlignment:
                            //                   MainAxisAlignment.spaceBetween,
                            //               children: [
                            //                 InkWell(
                            //                   onTap: () {
                            //                     setState(() {
                            //                       controller.instantType =
                            //                           InstantType.audio;
                            //                     });
                            //                   },
                            //                   child: Container(
                            //                     padding: EdgeInsets.only(
                            //                         right: 15),
                            //                     decoration: BoxDecoration(
                            //                         borderRadius:
                            //                             BorderRadius.only(
                            //                                 topLeft: Radius
                            //                                     .circular(7),
                            //                                 bottomLeft: Radius
                            //                                     .circular(7)),
                            //                         color: Colors.white
                            //                         // color: controller
                            //                         //                 .instantType ==
                            //                         //             InstantType.audio
                            //                         //         ? greenish
                            //                         //         : Color.fromARGB(
                            //                         //         255, 255, 255, 255),
                            //                         ),
                            //                     child: Row(
                            //                       mainAxisAlignment:
                            //                           MainAxisAlignment.start,
                            //                       children: [
                            //                         SvgPicture.asset(
                            //                             "assets/icons/audio.svg"),
                            //                         Text(
                            //                           "Audio Now".tr,
                            //                           style: TextStyle(
                            //                             color: Colors.black,
                            //                             fontSize: 12,

                            //                             // color: controller
                            //                             //             .instantType ==
                            //                             //         InstantType
                            //                             //             .audio
                            //                             //     ? Colors.white
                            //                             //     : Colors.black,
                            //                           ),
                            //                         ),
                            //                       ],
                            //                     ),
                            //                   ),
                            //                 ),
                            //                 Text("/"),
                            //                 InkWell(
                            //                   onTap: () {
                            //                     setState(() {
                            //                       controller.instantType =
                            //                           InstantType.video;
                            //                     });
                            //                   },
                            //                   child: Container(
                            //                     padding: EdgeInsets.only(
                            //                         right: 15),
                            //                     decoration: BoxDecoration(
                            //                         borderRadius:
                            //                             BorderRadius.only(
                            //                                 topRight: Radius
                            //                                     .circular(7),
                            //                                 bottomRight:
                            //                                     Radius
                            //                                         .circular(
                            //                                             7)),
                            //                         color: Colors.white
                            //                         // color: controller
                            //                         //             .instantType ==
                            //                         //         InstantType.video
                            //                         //     ? greenish
                            //                         //     : Color.fromARGB(
                            //                         //         255, 255, 255, 255),
                            //                         ),
                            //                     child: Row(
                            //                       mainAxisAlignment:
                            //                           MainAxisAlignment.start,
                            //                       children: [
                            //                         SvgPicture.asset(
                            //                             "assets/icons/video.svg"),
                            //                         Text(
                            //                           "Video Now".tr,
                            //                           maxLines: 2,
                            //                           style: TextStyle(
                            //                             color: Colors.black,
                            //                             fontSize: 12,
                            //                             // color: controller
                            //                             //             .instantType ==
                            //                             //         InstantType
                            //                             //             .video
                            //                             //     ? Colors.white
                            //                             //     : Colors.black,
                            //                           ),
                            //                         ),
                            //                       ],
                            //                     ),
                            //                   ),
                            //                 )
                            //               ],
                            //             ),
                            //           ),
                            //           Padding(
                            //             padding:
                            //                 const EdgeInsets.only(top: 10),
                            //             child: Row(
                            //               children: [
                            //                 Container(
                            //                   width: MediaQuery.of(context)
                            //                           .size
                            //                           .width *
                            //                       0.88,
                            //                   child: Text(
                            //                     "How many hours do you need the translator/interpreter for?"
                            //                         .tr,
                            //                     style: TextStyle(
                            //                         fontSize: 14,
                            //                         fontWeight:
                            //                             FontWeight.bold),
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //           SingleChildScrollView(
                            //             scrollDirection: Axis.horizontal,
                            //             child: Row(
                            //               children: List.generate(7, (index) {
                            //                 // Calculate the time for each slot
                            //                 int hour = (index + 1) ~/
                            //                     2; // Divide by 2 to get the hour value
                            //                 int minutes = ((index + 1) % 2) *
                            //                     30; // Multiply by 30 to get the minutes value

                            //                 int totalMinutes =
                            //                     hour * 60 + minutes;
                            //                 // Format the time as a string
                            //                 String time =
                            //                     '${hour.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';

                            //                 return GestureDetector(
                            //                   onTap: () {
                            //                     controller.setAmountBySlot(
                            //                         hour,
                            //                         minutes,
                            //                         time,
                            //                         widget.detail!,
                            //                         totalMinutes);
                            //                   },
                            //                   child: Container(
                            //                     margin: EdgeInsets.all(9),
                            //                     width: 125,
                            //                     height: 43,
                            //                     decoration: BoxDecoration(
                            //                       border: Border.all(
                            //                         color: Color.fromRGBO(
                            //                             0, 0, 0, 0.24),
                            //                         width: 1,
                            //                       ),
                            //                       borderRadius:
                            //                           BorderRadius.circular(
                            //                               8),
                            //                       color: controller
                            //                                   .instantTime ==
                            //                               time
                            //                           ? greenish
                            //                           : Colors.white,
                            //                     ),
                            //                     child: Center(
                            //                       child: Text(
                            //                         '$time' == '00:30'
                            //                             ? '$time' + ' min'
                            //                             : '$time' + ' hr',
                            //                         style: TextStyle(
                            //                             fontSize: 12,
                            //                             color: controller
                            //                                         .instantTime ==
                            //                                     time
                            //                                 ? Colors.white
                            //                                 : Colors.black),
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 );
                            //               }),
                            //             ),
                            //           ),
                            //         ],
                            //       )
                            //     : Container(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(children: [
                  widget.detail!.service!.isInperson! ||
                          widget.detail!.service!.isAudioVideo!
                      ? Row(
                          children: [
                            TralingRadioBtn(
                              text: 'Schedule'.tr,
                              isSelected: controller.serviceType ==
                                  ServiceType.Schedule,
                              ontap: () {
                                setState(() {
                                  controller.serviceType = ServiceType.Schedule;
                                  if (widget.detail!.service!.isInperson! &&
                                      widget.detail!.service!.isAudioVideo!) {
                                    controller.resetInstant();
                                  }
                                });
                              },
                            ),
                          ],
                        )
                      : SizedBox(),
                  controller.serviceType == ServiceType.Schedule
                      ? Column(
                          children: [
                            widget.detail!.service!.isAudioVideo == true
                                ? RadioBtn(
                                    text: 'Audio/video meeting'.tr,
                                    image:
                                        'assets/images/output-onlinepngtools (11).png',
                                    groupvalue: controller.scheduleType,
                                    value: ScheduleType.AudioVideo,
                                    onChanged: () {
                                      controller
                                          .toggleplan(ScheduleType.AudioVideo);
                                    },
                                  )
                                : Container(),
                            widget.detail!.service!.isInperson! == true
                                ? RadioBtn(
                                    text: 'In person meeting'.tr,
                                    image:
                                        'assets/images/output-onlinepngtools (10).png',
                                    groupvalue: controller.scheduleType,
                                    value: ScheduleType.InPerson,
                                    onChanged: () {
                                      controller
                                          .toggleplan(ScheduleType.InPerson);
                                    },
                                  )
                                : Container(),
                            controller.scheduleType == ScheduleType.InPerson
                                ? IconsButton(
                                    title: 'Choose Location'.tr,
                                    icon: Icons.my_location_rounded,
                                    onPressed: () {
                                      // controller.getlocation();
                                      Get.to(() => DeliveryMap(widget.detail));
                                    })
                                : Container(),
                            SizedBox(
                              height: 10,
                            ),
                            IconsButton(
                              title: 'Choose Date'.tr +
                                  ' (' +
                                  DateFormat('dd-MM-yyyy')
                                      .format(controller.selectedDay.value) +
                                  ')',
                              icon: Icons.calendar_month,
                              onPressed: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Directionality(
                                      textDirection: ui.TextDirection.ltr,
                                      child: StatefulBuilder(
                                        builder: (BuildContext context,
                                            StateSetter setState) {
                                          // Define a callback function to update the selected date
                                          void onDateSelected(
                                              DateTime selectedDay,
                                              DateTime focusedDay) {
                                            controller.setSelectedDay(
                                                selectedDay, focusedDay);
                                            setState(() {});
                                          }

                                          return Wrap(
                                            children: [
                                              TableCalendar(
                                                calendarFormat:
                                                    CalendarFormat.month,
                                                availableCalendarFormats: const {
                                                  CalendarFormat.month: 'Month',
                                                  // CalendarFormat.week: 'Week',
                                                },
                                                firstDay: now,
                                                lastDay: nextSixMonths!,
                                                focusedDay:
                                                    controller.focusedDay.value,
                                                calendarStyle: CalendarStyle(
                                                  todayDecoration:
                                                      BoxDecoration(
                                                          color: greenish
                                                              .withOpacity(0.5),
                                                          shape:
                                                              BoxShape.circle),
                                                  selectedDecoration:
                                                      BoxDecoration(
                                                    color:
                                                        greenish, // Customize the background color of the selected day
                                                    shape: BoxShape
                                                        .circle, // Customize the shape of the selected day
                                                  ),
                                                  selectedTextStyle: TextStyle(
                                                    color:
                                                        white, // Customize the text color of the selected day
                                                    fontWeight: FontWeight
                                                        .bold, // Customize the font weight of the selected day
                                                  ),
                                                ),
                                                selectedDayPredicate: (day) {
                                                  return isSameDay(
                                                      controller
                                                          .selectedDay.value,
                                                      day);
                                                },
                                                onDaySelected: onDateSelected,
                                              ),
                                              Center(
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      bottom: 30, top: 16),
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.8,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      // Call the callback to update the button text
                                                      controller
                                                          .updateButtonText(
                                                              controller
                                                                  .selectedDay);
                                                      Navigator.of(context)
                                                          .pop(); // Close the bottom sheet
                                                    },
                                                    child: Text('Done'.tr),
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
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Set Time".tr,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          '(' +
                                              "Gulf Standard Time United Arab Emirates Time"
                                                  .tr +
                                              ')',
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            widget.detail!.service!.isdocument == true
                                ? Row(
                                    children: [
                                      TralingRadioBtn(
                                        text: 'Document Type'.tr,
                                        isSelected: controller.serviceType ==
                                            ServiceType.Document,
                                        ontap: () {
                                          setState(() {
                                            controller.serviceType =
                                                ServiceType.Document;
                                            controller.resetInstant();
                                          });
                                        },
                                      ),
                                    ],
                                  )
                                : Container(),
                            controller.serviceType == ServiceType.Document
                                ? Column(
                                    children: [
                                      RadioBtn2(
                                        text: 'Urgent Document'.tr,
                                        groupvalue: controller.documentType,
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
                                        groupvalue: controller.documentType,
                                        value: DocumentType.NotUrgent,
                                        onChanged: () {
                                          controller.toggledocumentplan(
                                              DocumentType.NotUrgent);
                                          translatorProfileController
                                              .resetvalue();
                                        },
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.42,
                                            child: Row(
                                              children: [
                                                Container(
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                        color: greenish
                                                            .withOpacity(0.2),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    25))),
                                                    child: SvgPicture.asset(
                                                      "assets/icons/doc.svg",
                                                      height: 22,
                                                    )),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 12, right: 12),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Document".tr,
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.42,
                                            child: Row(
                                              children: [
                                                Container(
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: greenish),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    25))),
                                                    child: InkWell(
                                                      onTap: () {
                                                        translatorProfileController
                                                            .picksinglefile();
                                                      },
                                                      child: SvgPicture.asset(
                                                        "assets/icons/attachFile.svg",
                                                        height: 22,
                                                      ),
                                                    )),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: Text(
                                                    "Attach File".tr,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
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
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                              child: Text(
                                                "How many pages are there in the document?"
                                                    .tr,
                                                maxLines: 2,
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                            AutoSizeTextField(
                                              controller: pagecontoller,
                                              fullwidth: false,
                                              style: TextStyle(fontSize: 18),
                                              maxLines: 1,
                                              minWidth: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.25,
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
                                                            widget.detail!);
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
                                            // SizedBox(
                                            //   width: MediaQuery.of(context)
                                            //           .size
                                            //           .width *
                                            //       0.2,
                                            //   child: Row(
                                            //     mainAxisAlignment:
                                            //         MainAxisAlignment
                                            //             .spaceBetween,
                                            //     children: [
                                            //       AddRemoveBtn(
                                            //           ontap: () async {
                                            //             setState(() {
                                            //               if (controller
                                            //                       .pages ==
                                            //                   0) {
                                            //                 print(controller
                                            //                     .pages);
                                            //               } else {
                                            //                 controller
                                            //                     .pages--;
                                            //                 translatorProfileController
                                            //                     .dayscalculate(
                                            //                         widget
                                            //                             .detail!);
                                            //                 translatorProfileController
                                            //                     .documentprice(
                                            //                         widget
                                            //                             .detail!);
                                            //               }
                                            //             });
                                            //           },
                                            //           icon: '-'),
                                            //       Text(
                                            //           translatorProfileController
                                            //               .pages
                                            //               .toString()),
                                            //       AddRemoveBtn(
                                            //         ontap: () {
                                            //           setState(() {
                                            //             if (translatorProfileController
                                            //                     .documentType ==
                                            //                 DocumentType
                                            //                     .Urgent) {
                                            //               if (controller
                                            //                       .pages ==
                                            //                   translatorProfileController
                                            //                       .maxPage) {
                                            //                 print(controller
                                            //                     .pages);
                                            //               } else {
                                            //                 translatorProfileController
                                            //                     .pages++;
                                            //                 translatorProfileController
                                            //                     .dayscalculate(
                                            //                         widget
                                            //                             .detail!);
                                            //                 translatorProfileController
                                            //                     .documentprice(
                                            //                         widget
                                            //                             .detail!);
                                            //               }
                                            //             } else {
                                            //               if (controller
                                            //                       .pages ==
                                            //                   translatorProfileController
                                            //                       .umaxpage) {
                                            //                 print(controller
                                            //                     .pages);
                                            //               } else {
                                            //                 translatorProfileController
                                            //                     .pages++;
                                            //                 translatorProfileController
                                            //                     .dayscalculate(
                                            //                         widget
                                            //                             .detail!);
                                            //                 translatorProfileController
                                            //                     .documentprice(
                                            //                         widget
                                            //                             .detail!);
                                            //               }
                                            //             }
                                            //           });
                                            //         },
                                            //         icon: '+',
                                            //         color: greenish,
                                            //         iconcolor: white,
                                            //       )
                                            //     ],
                                            //   ),
                                            // )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12, bottom: 12),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Will deliver in:".tr + " ",
                                              style: TextStyle(fontSize: 14),
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
                              padding: EdgeInsets.only(top: 16, bottom: 30),
                              child: CheckOutButton(
                                title: 'Checkout'.tr,
                                price: controller.totalAmount.toString(),
                                sreenRatio: 0.9,
                                currencyname: selectedCurrency != null
                                    ? currencycontroller.selectedCurrency
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
                                  }
                                  // else if (controller.serviceType ==
                                  //     ServiceType.Instant) {
                                  //   if (controller.totalAmount <= 0) {
                                  //     Get.snackbar("",
                                  //         "Please fill all required details.",
                                  //         snackPosition: SnackPosition.BOTTOM,
                                  //         backgroundColor: Colors.red,
                                  //         colorText: Colors.white);
                                  //     return;
                                  //   }
                                  //   translatorProfileController
                                  //           .CheckoutAmount =
                                  //       controller.totalAmount;
                                  //   setState(() {});

                                  //   Get.to(() => Checkout_screen(
                                  //         totalAmount: controller
                                  //             .CheckoutAmount.toString(),
                                  //       ));
                                  // }
                                  else {
                                    controller
                                        .checkavailability(widget.detail!);
                                  }

                                  //  update(context);
                                },
                                color: greenish,
                                textcolor: Colors.white,
                                buttonWidth: 0.95,
                              ),
                            )
                          ],
                        )
                      : Container(),
                ]),
              )
            ]),
          ),
        ),
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
