import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:translation/screens/setting/settingcontroller.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/static/buginput.dart';
import 'package:translation/values/controllers.dart';

class BugReportModal extends StatefulWidget {
  const BugReportModal({super.key});

  @override
  State<BugReportModal> createState() => _BugReportModalState();
}

class _BugReportModalState extends State<BugReportModal> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
        builder: (controller) => Container(
              width: 313,
              height: 275,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      settingController.selectbugImage();
                    },
                    child: Container(
                      width: 43,
                      height: 43,
                      decoration: BoxDecoration(
                        color: greenish.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                          child: settingController.bugImage!.path == ''
                              ? SvgPicture.asset(
                                  "assets/icons/attachFile.svg",
                                  height: 22,
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.file(
                                      File(settingController.bugImage!.path),
                                      height: 43,
                                      width: 43,
                                      fit: BoxFit.cover),
                                )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      'Please attach screenshot of the issue',
                      style: TextStyle(fontSize: 11),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BugInput(
                        controller: settingController.bugcontroller,
                        text: 'type',
                        maxlines: true,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () {
                          settingController.addbug();
                          Navigator.pop(context);
                        },
                        child: Text('Send'),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(greenish),
                          fixedSize: MaterialStateProperty.all(Size(238, 64)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ));
  }
}
