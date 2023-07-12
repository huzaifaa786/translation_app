import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translation/screens/translator/translator_profile.dart';
import 'package:translation/screens/translator_screens/translator_screen.dart';
import 'package:translation/static/favorites_card.dart';
import 'package:translation/static/titletopbar.dart';
import 'package:translation/values/controllers.dart';

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
              text: 'Favorites',
              ontap: () {
                Get.back();
              },
            ),
            SizedBox(
              height: 20,
            ),
             Expanded(
                    child: ListView.builder(
                        itemCount: favController.Fav.length ,
                         
                        itemBuilder: (context, index) => FavoritesCard(
                              name: favController.Fav[index].vendor!.name,
                              image: favController
                                  .Fav[index].vendor!.profilePic,
                              lang:
                                  favController.Fav[index].vendor!.language,
                              vendor: favController.Fav[index].vendor,
                              price: favController.Fav[index]
                                  .vendor!.service!.onlineaudiovideoPrice,
                              rating:
                                  favController.Fav[index].vendor!.rating,
                            )),
                  )
          ],
        ),
      ),
    );
  }
}
