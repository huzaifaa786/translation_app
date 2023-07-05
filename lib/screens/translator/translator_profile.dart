import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:translation/models/vendor.dart';
import 'package:translation/screens/translator/map.dart';
import 'package:translation/screens/translator/radio_btn.dart';
import 'package:translation/screens/translator/traling_radio.dart';
import 'package:translation/screens/translator/translator_profile_controller.dart';
import 'package:translation/static/add_remove.dart';
import 'package:translation/static/checkout_button.dart';
import 'package:translation/static/freeitaminput.dart';
import 'package:translation/static/icon_button.dart';
import 'package:translation/static/lang_box.dart';
import 'package:translation/static/profile_detail.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/screens/checkout/checkout.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:translation/values/controllers.dart';

class TraslatorProfile extends StatefulWidget {
  const TraslatorProfile({super.key, required this.detail});
  final Vendor? detail;

  @override
  State<TraslatorProfile> createState() => _TraslatorProfileState();
}

class _TraslatorProfileState extends State<TraslatorProfile> {
  vendor() async {
    translatorProfileController.vendors = widget.detail;
    if(widget.detail!.online ==0)
    translatorProfileController.serviceType = ServiceType.Schedule;
    print(translatorProfileController.vendors);
    setState(() {});
  }

  DateTime now = DateTime.now();
  DateTime? nextSixMonths;

  @override
  void initState() {
    nextSixMonths = now.add(Duration(days: 180));
    vendor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TranslatorProfileController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: SvgPicture.asset("assets/icons/back.svg")),
                      Text(
                        "Detail",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 21),
                      ),
                      InkWell(
                          onTap: () {
                            translatorProfileController
                                .addfavorit(widget.detail!);
                          },
                          child: SvgPicture.asset("assets/images/heart.svg")),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.834,
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProfileDetail(
                          name: widget.detail!.name,
                          rating: widget.detail!.rating,
                          image: widget.detail!.profilePic,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            children: [
                              Text(
                                "Language",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 8),
                          width: double.infinity,
                          child: Wrap(
                            direction: Axis.horizontal,
                            runAlignment: WrapAlignment.start,
                            children: [
                              for (var i = 0;
                                  i < widget.detail!.language!.length;
                                  i++)
                                LanguageBox(lang: widget.detail!.language![i]),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            children: [
                              Text(
                                "Certificates",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        widget.detail!.certificate == ''
                            ? Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("No certificate uploaded!"),
                                  ],
                                ),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 15),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/images/certificate.svg"),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Text(
                                        "lorem ipsum dolor sit",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        Row(
                          children: [
                            Text(
                              "About",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        widget.detail!.aboutEnglish == ''
                            ? Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("About Empty."),
                                  ],
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(
                                    top: 15.0, bottom: 15),
                                child: Text(
                                  widget.detail!.aboutEnglish!,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              widget.detail!.online! == 1 ?
                        TralingRadioBtn(
                          text: 'Instant',
                          isSelected:
                              controller.serviceType == ServiceType.Instant,
                          ontap: () {
                            setState(() {
                              controller.serviceType = ServiceType.Instant;
                              controller.resetInstant();
                            });
                          },
                        ):Text(''),
                        controller.serviceType == ServiceType.Instant
                            ? Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 48,
                                    margin: EdgeInsets.only(top: 8),
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: greenish)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              controller.instantType =
                                                  InstantType.audio;
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.only(right: 15),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(7),
                                                  bottomLeft:
                                                      Radius.circular(7)),
                                              color: controller.instantType ==
                                                      InstantType.audio
                                                  ? greenish
                                                  : Color.fromARGB(
                                                      255, 255, 255, 255),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SvgPicture.asset(
                                                    "assets/icons/audio.svg"),
                                                Text(
                                                  "Audio Now",
                                                  style: TextStyle(
                                                    color: controller
                                                                .instantType ==
                                                            InstantType.audio
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Text("/"),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              controller.instantType =
                                                  InstantType.video;
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.only(right: 15),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(7),
                                                  bottomRight:
                                                      Radius.circular(7)),
                                              color: controller.instantType ==
                                                      InstantType.video
                                                  ? greenish
                                                  : Color.fromARGB(
                                                      255, 255, 255, 255),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SvgPicture.asset(
                                                    "assets/icons/video.svg"),
                                                Text(
                                                  "Video Now",
                                                  style: TextStyle(
                                                    color: controller
                                                                .instantType ==
                                                            InstantType.video
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          "How many hours do you need translator",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: List.generate(7, (index) {
                                        // Calculate the time for each slot
                                        int hour = (index + 1) ~/
                                            2; // Divide by 2 to get the hour value
                                        int minutes = ((index + 1) % 2) *
                                            30; // Multiply by 30 to get the minutes value

                                        int totalMinutes = hour * 60 + minutes;
                                        // Format the time as a string
                                        String time =
                                            '${hour.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';

                                        return GestureDetector(
                                          onTap: () {
                                            controller.setAmountBySlot(
                                                hour,
                                                minutes,
                                                time,
                                                widget.detail!,
                                                totalMinutes);
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(9),
                                            width: 125,
                                            height: 43,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.24),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color:
                                                  controller.instantTime == time
                                                      ? greenish
                                                      : Colors.white,
                                            ),
                                            child: Center(
                                              child: Text(
                                                '$time' == '00:30'
                                                    ? '$time' + ' min'
                                                    : '$time' + ' hr',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: controller
                                                                .instantTime ==
                                                            time
                                                        ? Colors.white
                                                        : Colors.black),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
                        TralingRadioBtn(
                          text: 'Schedule',
                          isSelected:
                              controller.serviceType == ServiceType.Schedule,
                          ontap: () {
                            setState(() {
                              controller.serviceType = ServiceType.Schedule;
                              controller.resetInstant();
                            });
                          },
                        ),
                        controller.serviceType == ServiceType.Schedule
                            ? Column(
                                children: [
                                  RadioBtn(
                                    text: 'Audio/Video',
                                    groupvalue: controller.scheduleType,
                                    value: ScheduleType.AudioVideo,
                                    onChanged: () {
                                      controller
                                          .toggleplan(ScheduleType.AudioVideo);
                                    },
                                  ),
                                  RadioBtn(
                                    text: 'In person',
                                    groupvalue: controller.scheduleType,
                                    value: ScheduleType.InPerson,
                                    onChanged: () {
                                      controller
                                          .toggleplan(ScheduleType.InPerson);
                                    },
                                  ),
                                  controller.scheduleType ==
                                          ScheduleType.InPerson
                                      ? IconsButton(
                                          title: 'Choose location',
                                          icon: Icons.my_location_rounded,
                                          onPressed: () {
                                            // controller.getlocation();
                                            Get.to(() =>
                                                DeliveryMap(widget.detail));
                                          })
                                      : Container(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  IconsButton(
                                    title: 'Choose Date '
                                       ,
                                    icon: Icons.calendar_month,
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return StatefulBuilder(
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

                                              return Column(
                                                children: [
                                                  Expanded(
                                                    child: TableCalendar(
                                                      calendarFormat:
                                                          CalendarFormat.month,
                                                      availableCalendarFormats: const {
                                                        CalendarFormat.month:
                                                            'Month',
                                                        // CalendarFormat.week: 'Week',
                                                      },
                                                      firstDay: now,
                                                      lastDay: nextSixMonths!,
                                                      focusedDay: controller
                                                          .focusedDay.value,
                                                      calendarStyle:
                                                          CalendarStyle(
                                                        todayDecoration:
                                                            BoxDecoration(
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
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: 16),
                                                    width:
                                                        MediaQuery.of(context)
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
                                                      child: Text('Done'),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Set Time",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.38,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: DateTimePicker(
                                          type: DateTimePickerType.time,
                                          initialValue: '',
                                          timeLabelText: "Start time",
                                          onChanged: (val) {
                                            controller.startTime = val;
                                            setState(() {});
                                            print(controller.startTime);
                                          },
                                          validator: (val) {
                                            return null;
                                          },
                                          onSaved: (val) => print(val),
                                        ),
                                      ),
                                      controller.startTime == ''
                                          ? Container()
                                          : Text("To"),
                                      controller.startTime == ''
                                          ? Container()
                                          : Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.38,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: DateTimePicker(
                                                type: DateTimePickerType.time,
                                                initialValue: '',
                                                timeLabelText: "End time",
                                                onChanged: (val) {
                                                  controller.endTime = val;
                                                  print(controller.endTime);
                                                  translatorProfileController
                                                      .calTotalTime(
                                                          widget.detail!);
                                                },
                                                validator: (val) {
                                                  return null;
                                                },
                                              ),
                                            ),
                                    ],
                                  ),
                                ],
                              )
                            : Container(),
                        TralingRadioBtn(
                          text: 'Document Type',
                          isSelected:
                              controller.serviceType == ServiceType.Document,
                          ontap: () {
                            setState(() {
                              controller.serviceType = ServiceType.Document;
                              controller.resetInstant();
                            });
                          },
                        ),
                        controller.serviceType == ServiceType.Document
                            ? Column(
                                children: [
                                  RadioBtn(
                                    text: 'Urgent Document',
                                    groupvalue: controller.documentType,
                                    value: DocumentType.Urgent,
                                    onChanged: () {
                                      controller.toggledocumentplan(
                                          DocumentType.Urgent);
                                      translatorProfileController.resetvalue();
                                    },
                                  ),
                                  RadioBtn(
                                    text: 'Not Urgent Document',
                                    groupvalue: controller.documentType,
                                    value: DocumentType.NotUrgent,
                                    onChanged: () {
                                      controller.toggledocumentplan(
                                          DocumentType.NotUrgent);
                                      translatorProfileController.resetvalue();
                                    },
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
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
                                              padding: const EdgeInsets.only(
                                                  left: 12),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Document",
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
                                        width:
                                            MediaQuery.of(context).size.width *
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
                                              padding: const EdgeInsets.only(
                                                  left: 8),
                                              child: Text(
                                                "Attach File",
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
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "How many pages in a doc",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              AddRemoveBtn(
                                                  ontap: () {
                                                    setState(() {
                                                      if (controller.pages ==
                                                          0) {
                                                        print(controller.pages);
                                                      } else {
                                                        controller.pages--;
                                                        translatorProfileController
                                                            .documentprice(
                                                                widget.detail!);
                                                      }
                                                    });
                                                  },
                                                  icon: '-'),
                                              Text(controller.pages.toString()),
                                              AddRemoveBtn(
                                                ontap: () {
                                                  setState(() {
                                                    controller.pages++;
                                                    translatorProfileController
                                                        .documentprice(
                                                            widget.detail!);
                                                  });
                                                },
                                                icon: '+',
                                                color: greenish,
                                                iconcolor: white,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12, bottom: 12),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Will deliver in: 3 days",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  FreeItemInput(
                                    padding: false,
                                    controller: translatorProfileController
                                        .descriptionController,
                                  ),
                                ],
                              )
                            : Container(),
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 30),
                          child: CheckOutButton(
                            title: 'Checkout',
                            price: controller.totalAmount.toString(),
                            sreenRatio: 0.9,
                            onPressed: () {
                              if (controller.serviceType ==
                                  ServiceType.Document) {
                                if (translatorProfileController.file == null) {
                                  Get.snackbar("Error!", "file can't be null",
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white);
                                  return;
                                }
                                Get.to(() => Checkout_screen(
                                  
                                      totalAmount:
                                          controller.totalAmount.toString(),
                                    ));
                              } else {
                                controller.checkavailability(widget.detail!);
                              }

                              //  update(context);
                            },
                            color: greenish,
                            textcolor: Colors.white,
                            buttonWidth: 0.95,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
