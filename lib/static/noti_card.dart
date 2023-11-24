import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/static/bagee.dart';
import 'package:translation/values/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    super.key,
    this.image,
    this.title,
    this.day,
    this.status,
    this.ontap,
    this.badgetitle,
    this.badgecolor,
    this.name,
  });
  final name;
  final image;
  final title;
  final status;
  final day;
  final ontap;
  final badgetitle;
  final badgecolor;

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    print(status);
    return InkWell(
      onTap: ontap,
      child: Card(
        shadowColor: Colors.grey,
        elevation: 2,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 14, 8, 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(45),
                    child: image == ''
                        ? Image(
                            image: AssetImage('assets/images/5907.jpg'),
                            height: 65,
                            width: 65,
                          )
                        : CachedNetworkImage(
                            imageUrl: image,
                            height: 65,
                            width: 65,
                          ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: box.read('locale') == 'ar'
                            ? EdgeInsets.only(right: 12)
                            : EdgeInsets.only(left: 12),
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                title == 'New order placed'
                                    ? 'New order placed'.tr
                                    : title == 'Your order has been accepted'
                                        ? 'Your order has been accepted'.tr
                                        : title ==
                                                'Your order has been rejected and order amount was refunded'
                                            ? 'Your order has been rejected and order amount was refunded'.tr
                                            : title ==
                                                    'Your order has been completed'
                                                ? 'Your order has been completed'.tr
                                                : title,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: hintText),
                                maxLines: 3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              status != ''
                  ? Badgee(
                      title: status == "3"
                          ? 'Completed'.tr
                          : status == "2"
                              ? "Rejected".tr
                              : "In progress".tr,
                      color: status == "3"
                          ? Colors.green
                          : status == "2"
                              ? Colors.red
                              : greenish,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
