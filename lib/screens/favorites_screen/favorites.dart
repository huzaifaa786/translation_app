import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translation/static/favorites_card.dart';
import 'package:translation/static/titletopbar.dart';
import 'package:translation/values/controllers.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Favorites_screen extends StatefulWidget {
  const Favorites_screen({super.key});

  @override
  State<Favorites_screen> createState() => _Favorites_screenState();
}

class _Favorites_screenState extends State<Favorites_screen> {
  fetchFav() async {
    await favController.getFav();
    setState(() {});
  }

  @override
  void initState() {
    fetchFav();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TitleTopbar(
              text: 'Favorites'.tr,
              ontap: () {
                Get.back();
              },
            ),
            SizedBox(
              height: 20,
            ),
            favController.Fav.length != 0
                ? Flexible(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: ListView.builder(
                          itemCount: favController.Fav.length,
                          itemBuilder: (context, index) => FavoritesCard(
                                name: favController.Fav[index].vendor!.name,
                                image:
                                    favController.Fav[index].vendor!.profilePic,
                                lang: favController.Fav[index].vendor!.language,
                                vendor: favController.Fav[index].vendor,
                                price: favController.Fav[index].vendor!.service!
                                    .audiovideo,
                                rating: favController.Fav[index].vendor!.rating,
                              )),
                    ),
                  )
                : Flexible(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.81,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.75,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/images/smiley.svg"),
                                SizedBox(height: 20),
                                Text(
                                  'No Favorites Found'.tr,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
