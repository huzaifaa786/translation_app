// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/screens/translator/translator_profile_controller.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/static/bagee.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gap/gap.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    this.image,
    this.id,
    this.day,
    this.type,
    this.ontap,
    this.name,
    this.price,
    this.onmsgtap,
    this.status,
    this.date,
    this.time,
    this.servicetype,
    this.page,
  });
  final type;
  final name;
  final image;
  final onmsgtap;
  final id;
  final day;
  final ontap;
  final price;
  final status;
  final date;
  final time;
  final servicetype;
  final page;

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    print('servicetype');
    print(servicetype);
    return Directionality(
      textDirection:
          box.read('locale') != 'ar' ? TextDirection.ltr : TextDirection.rtl,
      child: InkWell(
        onTap: ontap,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 4, bottom: 4, left: 12, right: 12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(45),
                            child: image == ''
                                ? Image(
                                    image: AssetImage('assets/images/5907.jpg'),
                                    height: 80,
                                    width: 80,
                                  )
                                : CachedNetworkImage(
                                    imageUrl: image,
                                    height: 80,
                                    width: 80,
                                  ),
                          ),
                        ],
                      ),
                      Container(
                        padding: box.read('locale') != 'ar'
                            ? EdgeInsets.only(left: 6)
                            : EdgeInsets.only(right: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Directionality(
                              textDirection: box.read('locale') != 'ar'
                                  ? TextDirection.ltr
                                  : TextDirection.rtl,
                              child: Text(
                                "Order No.".tr + id.toString(),
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Mazzard'),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            SizedBox(
                              width: Get.width * 0.7,
                              // decoration: BoxDecoration(border: Border.all()),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    name,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: greenish,
                                        fontFamily: 'Mazzard'),
                                  ),
                                  InkWell(
                                    onTap: onmsgtap,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 6,
                                          bottom: 6,
                                          left: 12,
                                          right: 12),
                                      child: SvgPicture.asset(
                                        'assets/images/msg.svg',
                                        height: 17,
                                        width: 17,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text(
                                type,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: lightblue,
                                    fontFamily: 'Mazzard'),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            servicetype == 'document'
                                ? Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Text(
                                      'Amount of pages:'.tr + ': ' + page,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Mazzard'),
                                    ),
                                  )
                                : Container(),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time_filled_outlined,
                                  color: greenish,
                                  size: 14,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                servicetype == 'document'
                                    ? Container()
                                    : Text(
                                        time + " | ",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: lightblue,
                                            fontWeight: FontWeight.w400),
                                      ),
                                Icon(
                                  Icons.calendar_month_sharp,
                                  color: greenish,
                                  size: 13,
                                ),
                                Gap(2),
                                Text(
                                  date,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: lightblue,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Gap(3),
                            Row(
                              children: [
                                Image.asset('assets/images/Banknotes.png'),
                                Text(
                                  price.toString() + ' ' + 'AED',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: lightblue,
                                      fontFamily: 'Mazzard'),
                                ),
                              ],
                            ),
                            Gap(6),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/loading.svg',
                                  height: 18,
                                  width: 29,
                                ),
                                Gap(5),
                                Text(
                                  status == "3"
                                      ? 'Completed'.tr
                                      : status == "2"
                                          ? "Rejected".tr
                                          : "In progress".tr,
                                  style: TextStyle(
                                      color: status == "3"
                                          ? Colors.green
                                          : status == "2"
                                              ? Colors.red
                                              : greenish,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                                Gap(10),
                                SvgPicture.asset(
                                  status == "3"
                                      ? 'assets/images/completed.svg'
                                      : status == "2"
                                          ? "assets/images/remove.svg"
                                          : "assets/images/timer.svg",
                                  height: 13,
                                  width: 13,
                                  color: status == "3"
                                      ? Colors.green
                                      : status == "2"
                                          ? Colors.red
                                          : greenish,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  // Text(
                  //   'AED' + ' ' + price.toString(),
                  //   style: TextStyle(
                  //       fontSize: 17,
                  //       fontWeight: FontWeight.w600,
                  //       fontFamily: 'Mazzard'),
                  // ),
                  // SizedBox(
                  //   height: 4,
                  // ),
                  // Badgee(
                  //   title: status == "3"
                  //       ? 'Completed'.tr
                  //       : status == "2"
                  //           ? "Rejected".tr
                  //           : "In progress".tr,
                  //   color: status == "3"
                  //       ? Colors.green
                  //       : status == "2"
                  //           ? Colors.red
                  //           : greenish,
                  // ),
                  // SizedBox(height: 6),
                  // Column(
                  //   children: [
                  //     InkWell(
                  //       onTap: onmsgtap,
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(
                  //             top: 6, bottom: 6, left: 12, right: 12),
                  //         child: SvgPicture.asset(
                  //           'assets/images/msg.svg',
                  //           height: 17,
                  //           width: 17,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  //   ],
                  // )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Divider(
                  color: Colors.grey, //color of divider
                  height: 5, //height spacing of divider
                  thickness: 1, //thickness of divier line
                  // indent: 25, //spacing at the start of divider
                  // endIndent: 25, //spacing at the end of divider
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
