import 'package:flutter/material.dart';
import 'package:translation/static/bagee.dart';
import 'package:translation/values/colors.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    super.key,
    this.image,
    this.title,
    this.day,
    this.ontap,
    this.badgetitle,
    this.badgecolor,
    this.name,
  });
  final name;
  final image;
  final title;
  final day;
  final ontap;
  final badgetitle;
  final badgecolor;

  @override
  Widget build(BuildContext context) {
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
                  Container(
                    width: MediaQuery.of(context).size.width * 0.12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        child: Image(
                            image:
                                AssetImage('assets/images/placeholder.png'))),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 12),
                        width: MediaQuery.of(context).size.width * 0.5,
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
                                title,
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: hintText),
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Badgee(
                title: badgetitle,
                color: badgecolor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
