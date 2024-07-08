// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/values/colors.dart';
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: Column(
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
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 6,
                    child: Container(
                      width: Get.width * 0.8,
                      padding: box.read('locale') != 'ar'
                          ? EdgeInsets.only(left: 8)
                          : EdgeInsets.only(right: 8),
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
                              ),
                            ),
                          ),
                          Gap(4),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: greenish,
                                      ),
                                    ),
                                    Gap(4),
                                    Text(
                                      type,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: greenish.withOpacity(0.7),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: onmsgtap,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 6, bottom: 6, left: 12, right: 12),
                                  child: SvgPicture.asset(
                                    'assets/images/msg.svg',
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          if (servicetype == 'document')
                            Text(
                              'Amount of pages:'.tr + ': ' + page,
                              style: TextStyle(
                                fontSize: 13,
                                color: greenish.withOpacity(0.77),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          if (servicetype == 'document') SizedBox(height: 4),
                          Row(
                            children: [
                              if (servicetype != 'document') ...[
                                Icon(
                                  Icons.access_time_filled_outlined,
                                  color: greenish,
                                  size: 20,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  time + " | ",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: greenish.withOpacity(0.7),
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                              Icon(
                                Icons.calendar_month_sharp,
                                color: greenish,
                                size: 20,
                              ),
                              Gap(4),
                              Text(
                                date,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: greenish.withOpacity(0.7),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Gap(3),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/bankNotes.jpg',
                                width: 18,
                              ),
                              Gap(4),
                              Text(
                                price.toString() + ' ' + 'AED',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: greenish.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                          Gap(8),
                          Row(
                            children: [
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
                              Gap(10),
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
                              
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
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
