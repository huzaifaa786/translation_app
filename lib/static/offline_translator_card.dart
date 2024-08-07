import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/models/service.dart';
import 'package:translation/screens/profile/profile.dart';
import 'package:translation/screens/translator/translator_profile.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/values/controllers.dart';

class OfflineTranslattorCard extends StatelessWidget {
  const OfflineTranslattorCard(
      {super.key,
      required this.name,
      required this.image,
      required this.lang,
      required this.price,
      required this.currencyname,
      required this.rating,
      required this.vendor});
  final name;
  final currencyname;
  final image;
  final lang;
  final price;
  final rating;
  final vendor;

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
      child: GestureDetector(
        onTap: () {
          translatorProfileController.clear();
          Get.to(() => TraslatorProfile(detail: vendor));
        },
        child: Container(
          decoration: BoxDecoration(
              color: ggrey,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400]!,
                  blurRadius: 2,
                  offset: Offset(0.00001, 3),
                ),
              ]),
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          // border: Border.all(width: 2, color: Color(0xFF34607B)),
                          // borderRadius: BorderRadius.circular(24),
                          ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 15,
                              color: greenish,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins'),
                        ),
                        price != null
                            ? Padding(
                                padding:
                                    const EdgeInsets.only(top: 2, bottom: 2),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/Time to Pay.png",
                                      color: greenish,
                                      height: 12,
                                      width: 12,
                                    ),
                                    Gap(3),
                                    Text(
                                      "Per 30 mins".tr + ': ',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: lightblue,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Poppins'),
                                    ),
                                    FutureBuilder<String>(
                                      future: changePrice(price),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return CircularProgressIndicator();
                                        } else if (snapshot.hasError) {
                                          return Text('Error');
                                        } else {
                                          return Text(
                                            '${snapshot.data} $currencyname',
                                            style: TextStyle(
                                              color: Colors.lightBlue,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Poppins',
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                        rating != null
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Image.asset(
                                            'assets/images/Star.png',
                                            height: 11,
                                            width: 11)),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 4, left: 2, right: 2),
                                      child: Text(
                                          rating == null
                                              ? '0.0'
                                              : rating.toStringAsFixed(1),
                                          style: TextStyle(
                                              color: lightblue,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'NunitoSans')),
                                    ),
                                  ],
                                ),
                              )
                            : Text(''),
                        Row(children: [
                          Image.asset("assets/images/Language.png"),
                          for (var i = 0; i < 3; i++)
                            if (i < lang.length)
                              Container(
                                width: MediaQuery.of(context).size.width * 0.16,
                                margin: EdgeInsets.only(left: 9),
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1.2, color: lightblue),
                                    borderRadius: BorderRadius.circular(13),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 195, 181, 181)!,
                                        blurRadius: 8,
                                        offset: Offset(0, 3),
                                      ),
                                    ]),
                                child: Text(
                                  lang[i],
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      TextStyle(fontSize: 12, color: greenish),
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
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
              // box.read('locale') != 'ar'
              //     ? FittedBox(
              //         fit: BoxFit.scaleDown,
              //         child: SvgPicture.asset("assets/icons/forward.svg",
              //             height: 30, width: 30))
              //     : FittedBox(
              //         fit: BoxFit.scaleDown,
              //         child: SvgPicture.asset("assets/icons/back.svg",
              //             height: 30, width: 30)),
            ],
          ),
        ),
      ),
    );
  }
}
