// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:translation/screens/translator/translator_profile_controller.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/static/bagee.dart';
import 'package:cached_network_image/cached_network_image.dart';

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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(top: 4, bottom: 4, left: 12, right: 12),
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
                      padding: const EdgeInsets.only(left: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order id # ' + id.toString(),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Mazzard'),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            name,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Mazzard'),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            type,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Mazzard'),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_outlined,
                                size: 14,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              type == 'document'
                                  ? Container()
                                  : Text(
                                      time + " | ",
                                      style: TextStyle(fontSize: 11),
                                    ),
                              Text(
                                date,
                                maxLines: 2,
                                style: TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'AED ' + price.toString(),
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Mazzard'),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Badgee(
                      title: status == "3"
                          ? 'Completed'
                          : status == "2"
                              ? "Rejected"
                              : "In progress",
                      color: status == "3"
                          ? Colors.green
                          : status == "2"
                              ? Colors.red
                              : greenish,
                    ),
                    SizedBox(height: 6),
                    Column(
                      children: [
                        // Padding(
                        //   padding:
                        //       const EdgeInsets.only(top: 6, bottom: 6),
                        //   child: Text(
                        //     "View Document",
                        //     style: TextStyle(
                        //         color: Colors.blue,
                        //         decoration: TextDecoration.underline,
                        //         fontSize: 9),
                        //   ),
                        // ),
                        InkWell(
                          onTap: onmsgtap,
                          child: SvgPicture.asset(
                            'assets/images/msg.svg',
                            height: 17,
                            width: 17,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
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
    );
  }
}
