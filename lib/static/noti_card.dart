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
    this.name,
  });
  final name;
  final image;
  final title;
  final day;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        shadowColor: Colors.grey,
        elevation: 3,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(6, 10, 6, 10),
          child: Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: greenish,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child:
                    Image(image: AssetImage('assets/images/apple.png')),
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 12),
                    width: MediaQuery.of(context).size.width * 0.78,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins'),
                        ),
                       
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins'),
                              maxLines: 2,
                            ),
                             Badgee(
                          title: 'Accepted',
                          color: greenish,
                        ),
                          ],
                        ),
                       
                      ],
                    ),
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
