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
    this.serviceType,
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
  final serviceType;

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
          padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
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
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            if (serviceType != null)
                              Text(
                                serviceType == 'audio/video'
                                    ? 'audio/video'.tr
                                    : serviceType == 'document'
                                        ? 'document'.tr
                                        : serviceType == 'inperson'
                                            ? 'inperson'.tr
                                            : serviceType == 'inPerson'
                                            ? 'inPerson'.tr
                                            : serviceType ==
                                                    'New message from metro'
                                                ? 'New message from metro'.tr
                                                : serviceType ==
                                                        "Your order has been rejected and order amount was refunded"
                                                    ? "Your order has been rejected and order amount was refunded"
                                                        .tr
                                                    : serviceType.toString(),
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300),
                              ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                title == 'New order placed'
                                    ? 'New order placed'.tr
                                    : title == 'Your order has been accepted'
                                        ? 'Your order has been accepted'.tr
                                        : title ==
                                                "Your order has been rejected and order amount was refunded"
                                            ? "Your order has been rejected and order amount was refunded"
                                                .tr
                                            : title ==
                                                    'Your order has been completed'
                                                ? 'Your order has been completed'
                                                    .tr
                                                : title ==
                                                        'New message from metro'
                                                    ? 'New message from metro'
                                                        .tr
                                                    : title,
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: greenish),
                                maxLines: 3,
                              ),
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
                                    picture: status == "3"
                                        ? "assets/images/Done.png"
                                        : status == "2"
                                            ? "assets/images/Close.png"
                                            : "assets/images/Historical.png",
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
