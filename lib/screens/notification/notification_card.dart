import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:translation/models/notification.dart';
import 'package:translation/screens/translator_screens/offline_translator/offline_people.dart';
import 'package:translation/static/large_button.dart';
import 'package:translation/values/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:translation/values/controllers.dart';

class NotificationModal extends StatelessWidget {
  const NotificationModal({super.key, this.notification});
  final Notificationn? notification;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Wrap(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.all(8),
                width: 98,
                height: 98,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Color(0xFF34607B)),
                  borderRadius: BorderRadius.circular(70),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(45),
                  child: notification!.vendor!.profilePic! == ''
                      ? Image(
                          image: AssetImage('assets/images/5907.jpg'),
                          height: 65,
                          width: 65,
                        )
                      : CachedNetworkImage(
                          imageUrl: notification!.vendor!.profilePic!,
                          height: 65,
                          width: 65,
                        ),
                ),
              ),
            ),
            Center(
              child: Text(
                notification!.vendor!.name!,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: const Text(
                "How do you rate your experience?",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBar.builder(
                  initialRating: 5,
                  minRating: 1,
                  glow: false,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                    notificationController.rating = rating;
                  },
                )
              ],
            ),
            const SizedBox(
              height: 65,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 28),
              child: Center(
                  child: LargeButton(
                title: 'Submit',
                sreenRatio: 0.8,
                onPressed: () {
                  notificationController.addrating(
                      notificationController.rating,
                      notification!.orderr!.id!,
                      notification!.vendor!.id!);
                      Get.back();
                },
                color: greenish,
                textcolor: Colors.white,
                buttonWidth: 0.95,
              )),
            ),
          ]),
    );
  }
}
