import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:translation/models/vendor.dart';
import 'package:translation/screens/home/translator/radio_btn.dart';
import 'package:translation/screens/home/translator/traling_radio.dart';
import 'package:translation/static/add_remove.dart';
import 'package:translation/static/checkout_button.dart';
import 'package:translation/static/day_date_card.dart';
import 'package:translation/static/freeitaminput.dart';
import 'package:translation/static/icon_button.dart';
import 'package:translation/static/lang_box.dart';
import 'package:translation/static/profile_detail.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/screens/checkout/checkout.dart';
import 'package:translation/screens/translator_screens/translator_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:location/location.dart';
import 'package:translation/values/controllers.dart';

class profile_translator extends StatefulWidget {
  const profile_translator({super.key, required this.detail});
  final Vendor? detail;

  @override
  State<profile_translator> createState() => _profile_translatorState();
}

enum meetingMethod { AudioVideo, InPerson }

enum meetingTypeMethod { Urgent, NotUrgent }

class _profile_translatorState extends State<profile_translator> {
  meetingMethod _site = meetingMethod.AudioVideo;
  void toggleplan(meetingMethod value) {
    setState(() {
      _site = value;
    });
  }

  meetingTypeMethod _site1 = meetingTypeMethod.Urgent;
  void toggleplan1(meetingTypeMethod value) {
    setState(() {
      _site1 = value;
    });
  }

  bool schedule = false;
  bool doc = false;

  int i = 0;
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
DateTime getDateOfCurrentWeekByDayName(String dayName) => DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)).add(Duration(days: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'].indexOf(dayName)));
  @override
  void initState() {
    print(widget.detail.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Translator_()));
                        },
                        child: SvgPicture.asset("assets/icons/back.svg")),
                    Text(
                      "Detail",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                    ),
                    SvgPicture.asset("assets/images/heart.svg"),
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
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae amet placerat dignissim nibh dictum sit. Pretium ornare viverra.,",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                        margin: EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: greenish)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset("assets/icons/audio.svg"),
                                Text("Audio Now"),
                              ],
                            ),
                            Text("/"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset("assets/icons/video.svg"),
                                Text("Video Now"),
                              ],
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
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(9),
                              width: 125,
                              height: 43,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Color.fromRGBO(0, 0, 0, 0.24),
                                    width: 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  '00:30 mins',
                                  style: TextStyle(fontSize: 12),
                                ),
                                
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(9),
                              width: 125,
                              height: 43,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Color.fromRGBO(0, 0, 0, 0.24),
                                    width: 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  '01:00 mins',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(9),
                              width: 125,
                              height: 43,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Color.fromRGBO(0, 0, 0, 0.24),
                                    width: 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  '01:30 mins',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      TralingRadioBtn(
                        text: 'Schedule',
                        schedule: schedule,
                        ontap: () {
                          setState(() {
                            schedule = !schedule;
                          });
                        },
                      ),
                      schedule == true
                          ? Column(
                              children: [
                                RadioBtn(
                                  text: 'Audio/Video',
                                  groupvalue: _site,
                                  value: meetingMethod.AudioVideo,
                                  onChanged: () {
                                    toggleplan(meetingMethod.AudioVideo);
                                  },
                                ),
                                RadioBtn(
                                  text: 'In person',
                                  groupvalue: _site,
                                  value: meetingMethod.InPerson,
                                  onChanged: () {
                                    toggleplan(meetingMethod.InPerson);
                                  },
                                ),
                                _site == meetingMethod.InPerson
                                    ? IconsButton(
                                        title: 'Choose location',
                                        onPressed: () {
                                          getlocation();
                                        })
                                    : Container(),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Container(
                                    padding: EdgeInsets.only(left: 10),
                                    height:
                                        MediaQuery.of(context).size.height * 0.15,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: widget
                                          .detail!.service!.schedual!.length,
                                      itemBuilder: (context, index) =>
                                          DateDayCard(
                                        date: getDateOfCurrentWeekByDayName(widget.detail!.service!
                                            .schedual![index].day!).day,
                                        day: widget.detail!.service!
                                            .schedual![index].day,
                                        color: widget.detail!.service!
                                                .schedual![index].isFrozen!
                                            ? Color.fromARGB(255, 224, 224, 224)
                                                .withOpacity(0.6)
                                            : white,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
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
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.38,
                                      height: 43,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.24),
                                            width: 1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '00:30 ',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ),
                                    Text("To"),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.38,
                                      height: 43,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.24),
                                            width: 1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '00:30 ',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : Container(),
                      TralingRadioBtn(
                        text: 'Document Type',
                        schedule: doc,
                        ontap: () {
                          setState(() {
                            doc = !doc;
                          });
                        },
                      ),
                      doc == true
                          ? Column(
                              children: [
                                RadioBtn(
                                  text: 'Urgent Document',
                                  groupvalue: _site1,
                                  value: meetingTypeMethod.Urgent,
                                  onChanged: () {
                                    toggleplan1(meetingTypeMethod.Urgent);
                                  },
                                ),
                                RadioBtn(
                                  text: 'Not Urgent Document',
                                  groupvalue: _site1,
                                  value: meetingTypeMethod.NotUrgent,
                                  onChanged: () {
                                    toggleplan1(meetingTypeMethod.NotUrgent);
                                  },
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.42,
                                      child: Row(
                                        children: [
                                          Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                  color:
                                                      greenish.withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(25))),
                                              child: SvgPicture.asset(
                                                "assets/icons/doc.svg",
                                                height: 22,
                                              )),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 12),
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
                                      width: MediaQuery.of(context).size.width *
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
                                                          Radius.circular(25))),
                                              child: SvgPicture.asset(
                                                "assets/icons/attachFile.svg",
                                                height: 22,
                                              )),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8),
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            AddRemoveBtn(
                                                ontap: () {
                                                  setState(() {
                                                    i--;
                                                  });
                                                },
                                                icon: '-'),
                                            Text(i.toString()),
                                            AddRemoveBtn(
                                              ontap: () {
                                                setState(() {
                                                  i++;
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
                                ),
                              ],
                            )
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 30),
                        child: CheckOutButton(
                          title: 'Checkout',
                          price: '50',
                          sreenRatio: 0.9,
                          onPressed: () {
                            setState(() {});
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Checkout_screen()));
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
