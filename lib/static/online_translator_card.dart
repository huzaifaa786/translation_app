import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:translation/screens/translator/translator_profile.dart';
import 'package:translation/values/controllers.dart';

class OnlineTranslatorCard extends StatelessWidget {
  const OnlineTranslatorCard(
      {super.key,
      required this.name,
      required this.image,
      this.vendor,
      this.rating,this.price});
  final name;
  final image;
  final vendor;
  final rating;
  final price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // translatorProfileController.clear();
        Get.to(() => TraslatorProfile(detail: vendor));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        color: Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width * 0.22,
                height: MediaQuery.of(context).size.height * 0.1,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Color(0xFF34607B)),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: image == ''
                        ? Image.asset(
                            "assets/images/5907.jpg",
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.height * 0.1,
                            fit: BoxFit.cover,
                          )
                        : CachedNetworkImage(
                            imageUrl: image,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.height * 0.1,
                          )),
              ),
              Text(
                name,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'NunitoSans'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SvgPicture.asset('assets/images/star.svg',
                          height: 11, width: 11)),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, left: 4),
                    child: Text(rating == null ? '0.0' : rating.toString(),
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'NunitoSans')),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4, left: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Rate per 30 mins:  ",
                      style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'NunitoSans'),
                    ),
                    Text(
                      price +" AED",
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'NunitoSans'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
