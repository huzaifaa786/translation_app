import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/screens/translator/translator_profile.dart';
import 'package:translation/values/controllers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:translation/values/colors.dart';

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
        Get.to(() => TraslatorProfile(detail: vendor));
      },
      child: Card(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey[500]!,
                blurRadius: 3,
                offset: Offset(0.00001, 1),
              ),
            ],
            color:ggrey,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(12.0),
          height: MediaQuery.of(context).size.height * 0.13,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset("assets/images/fav.svg"),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      ClipRRect(
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
                    ],
                  ),
                  Padding(
                    padding: box.read('locale') != 'ar'
                        ? EdgeInsets.only(left: 8, top: 4)
                        : EdgeInsets.only(right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 15,
                              color: greenish,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins'),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            for (var i = 0; i < 3; i++)
                              if (i < lang.length)
                                Container(
                                  margin: EdgeInsets.only(right: 9),
                                  padding: EdgeInsets.only(left: 13,right: 13,top: 5,bottom:5 ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border:
                                        Border.all(color: lightblue, width: 1.2),
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey[500]!,
                                        blurRadius: 5,
                                        offset: Offset(0.00001, 1),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    lang[i],
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: greenish,
                                    ),
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
