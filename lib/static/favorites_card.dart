import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/screens/translator/translator_profile.dart';
import 'package:translation/values/controllers.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FavoritesCard extends StatelessWidget {
  const FavoritesCard(
      {super.key,
      required this.name,
      required this.image,
      required this.lang,
      required this.price,
      required this.rating,
      required this.vendor});
  final name;
  final image;
  final lang;
  final price;
  final rating;
  final vendor;

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return GestureDetector(
      onTap: () {
        translatorProfileController.clear();
        // Get.to(() => TraslatorProfile(detail: vendor));
      },
      child: Card(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(0xFF34607B)),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(22),
                        child: image == ''
                            ? Image.asset(
                                "assets/images/5907.jpg",
                                width: 64,
                                height: 64,
                                fit: BoxFit.cover,
                              )
                            : CachedNetworkImage(
                                imageUrl: image,
                                fit: BoxFit.cover,
                                width: 64,
                                height: 64,
                              )),
                  ),
                  Padding(
                    padding: box.read('locale') != 'ar'
                        ? EdgeInsets.only(left: 8)
                        : EdgeInsets.only(right: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'NunitoSans'),
                        ),
                        price != null
                            ? Padding(
                                padding:
                                    const EdgeInsets.only(top: 2, bottom: 2),
                                child: Row(
                                  children: [
                                    Text(
                                      "Rate per 30 mins".tr + ': ',
                                      style: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'NunitoSans'),
                                    ),
                                    Text(
                                      price + ' ' + "AED".tr,
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'NunitoSans'),
                                    )
                                  ],
                                ),
                              )
                            : SizedBox(),
                        rating != null
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: SvgPicture.asset(
                                            'assets/images/star.svg',
                                            height: 11,
                                            width: 11)),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 4, left: 2),
                                      child: Text(
                                          rating == null
                                              ? '0.0'
                                              : rating.toString(),
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'NunitoSans')),
                                    ),
                                  ],
                                ),
                              )
                            : Text(''),
                        Row(
                          children: [
                            for (var i = 0; i < 3; i++)
                              if (i < lang.length)
                                Container(
                                  margin: EdgeInsets.only(left: 4),
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Color.fromRGBO(0, 0, 0, 0.24),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    lang[i],
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                            // Container(
                            //   margin: EdgeInsets.only(left: 4),
                            //   padding: EdgeInsets.all(4),
                            //   decoration: BoxDecoration(
                            //     color: Colors.white,
                            //     border: Border.all(
                            //         color: Color.fromRGBO(0, 0, 0, 0.24),
                            //         width: 1),
                            //     borderRadius: BorderRadius.circular(6),
                            //   ),
                            //   child: Text(
                            //     'Turkish',
                            //     style: TextStyle(fontSize: 12),
                            //   ),
                            // ),
                            // Container(
                            //   margin: EdgeInsets.only(left: 4),
                            //   padding: EdgeInsets.all(4),
                            //   decoration: BoxDecoration(
                            //     color: Colors.white,
                            //     border: Border.all(
                            //         color: Color.fromRGBO(0, 0, 0, 0.24),
                            //         width: 1),
                            //     borderRadius: BorderRadius.circular(6),
                            //   ),
                            //   child: Text(
                            //     'English',
                            //     style: TextStyle(fontSize: 12),
                            //   ),
                            // )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SvgPicture.asset("assets/images/fav.svg"),
            ],
          ),
        ),
        elevation: 5,
        shadowColor: Colors.black54,
        margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
