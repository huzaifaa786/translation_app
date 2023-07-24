import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translation/screens/main_screen/homecontroller.dart';
import 'package:translation/screens/translator_screens/offline_translator/offline_people.dart';
import 'package:translation/screens/translator_screens/online_translator/online_people.dart';
import 'package:translation/static/offline_translator_card.dart';
import 'package:translation/static/online_translator_card.dart';
import 'package:translation/static/search_topbar.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/values/controllers.dart';

class Translator_ extends StatefulWidget {
  const Translator_({super.key});

  @override
  State<Translator_> createState() => _Translator_State();
}

class _Translator_State extends State<Translator_> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          child: GetBuilder<HomeController>(
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchTopBar(
              onchange: homeController.searchVendors,
            ),
            homeController.sonlineVendor.length != 0
                  ? Padding(
              padding: const EdgeInsets.only(
                  left: 12, right: 12, top: 16, bottom: 12),
              child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Online translators / Interpreters",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins'),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => OnlinePeople_screen())!.then((value) {
                              homeController.onlineVendorUpdate();
                            });
                          },
                          child: Text(
                            "View All",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                color: Colors.grey[600]),
                          ),
                        ),
                      ],
                    )
                  ,
            ): Container(),
            homeController.sonlineVendor.length != 0
                ? Container(
                    padding: EdgeInsets.only(left: 10),
                    height: MediaQuery.of(context).size.height * 0.22,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: homeController.sonlineVendor.length > 6
                            ? 6
                            : homeController.sonlineVendor.length,
                        itemBuilder: (context, index) => OnlineTranslatorCard(
                              name: homeController.sonlineVendor[index].name,
                              image: homeController
                                  .sonlineVendor[index].profilePic,
                              rating:
                                  homeController.sonlineVendor[index].rating ==
                                          null
                                      ? null
                                      : double.parse(homeController
                                          .sonlineVendor[index].rating!),
                              vendor: homeController.sonlineVendor[index],
                              price: homeController.sonlineVendor[index]
                                  .service!.onlineaudiovideoPrice,
                            )),
                  )
                : Container(),
            Padding(
              padding:
                  EdgeInsets.only(left: 12, right: 12, top: 16, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Schedule translators / interpreters",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => OfflinePeople_screen())!.then((value) {
                        homeController.offlineVendorUpdate();
                      });
                    },
                    child: Text(
                      "View All",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          color: Colors.grey[600]),
                    ),
                  ),
                ],
              ),
            ),
            homeController.sschedule.length != 0
                ? Expanded(
                    child: ListView.builder(
                        itemCount: homeController.sschedule.length > 6
                            ? 6
                            : homeController.sschedule.length,
                        itemBuilder: (context, index) => OfflineTranslattorCard(
                              name: homeController.sschedule[index].name,
                              image: homeController
                                  .sschedule[index].profilePic,
                              lang:
                                  homeController.sschedule[index].language,
                              vendor: homeController.sschedule[index],
                              price: homeController.sschedule[index]
                                  .service!.onlineaudiovideoPrice,
                              rating:
                                  homeController.sschedule[index].rating ==
                                          null
                                      ? null
                                      : double.parse(homeController
                                          .sschedule[index].rating!),
                            )),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("No Schedule Translator Found!"),
                      ],
                    ),
                  )
          ],
        ),
      )),
    );
  }
}
