import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:translation/models/vendor.dart';
import 'package:translation/screens/main_screen/homecontroller.dart';
import 'package:translation/screens/translator_screens/offline_translator/offline_people.dart';
import 'package:translation/screens/translator_screens/online_translator/online_people.dart';
import 'package:translation/static/offline_translator_card.dart';
import 'package:translation/static/online_translator_card.dart';
import 'package:translation/static/search_topbar.dart';
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
      body: SafeArea(
          child: GetBuilder<HomeController>(
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchTopBar(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 12),
              child: homeController.onlineVendor.length != 0? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Online People",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OnlinePeople_screen()),
                      );
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
              ):Text(''),
            ),
            homeController.onlineVendor.length != 0
                ? Container(
                    padding: EdgeInsets.only(left: 10),
                    height: MediaQuery.of(context).size.height * 0.22,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: homeController.onlineVendor.length > 6
                            ? 6
                            : homeController.onlineVendor.length,
                        itemBuilder: (context, index) => OnlineTranslatorCard(
                              name: homeController.onlineVendor[index].name,
                              image:
                                  homeController.onlineVendor[index].profilePic,
                              rating: homeController.onlineVendor[index].rating,
                              vendor: homeController.onlineVendor[index],
                              // price: '10',
                              price: homeController.onlineVendor[index].service!
                                  .onlineaudiovideoPrice,
                            )),
                  )
                : Text(''),

            Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 10),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Schedule",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OfflinePeople_screen()),
                      );
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
            homeController.offlineVendor.length != 0
                ? Expanded(
                    child: ListView.builder(
                        itemCount: homeController.offlineVendor.length > 6
                            ? 6
                            : homeController.offlineVendor.length,
                        itemBuilder: (context, index) => OfflineTranslattorCard(
                              name: homeController.offlineVendor[index].name,
                              image: homeController
                                  .offlineVendor[index].profilePic,
                              lang:
                                  homeController.offlineVendor[index].language,
                              vendor: homeController.offlineVendor[index],
                              price: homeController.offlineVendor[index]
                                  .service!.onlineaudiovideoPrice,
                              rating:
                                  homeController.offlineVendor[index].rating,
                            )),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("No Offline Translator Found!"),
                      ],
                    ),
                  )
          ],
        ),
      )),
    );
  }
}
