import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:translation/models/vendor.dart';
import 'package:translation/screens/main_screen/homecontroller.dart';
import 'package:translation/screens/translator_screens/offline_translator/offline_people.dart';
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
                  left: 20, right: 20, top: 30, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Online People",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins'),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            controller.onlineVendor.length != 0
                ? Container(
                    padding: EdgeInsets.only(left: 10),
                    height: MediaQuery.of(context).size.height * 0.22,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: controller.onlineVendor.length > 6
                            ? 6
                            : controller.onlineVendor.length,
                        itemBuilder: (context, index) => OnlineTranslatorCard(
                              name: controller.onlineVendor[index].name,
                              image: controller.onlineVendor[index].profilePic,
                              vendor: controller.onlineVendor[index],
                            )),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height * 0.22,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("No Offline Translator Found!"),
                      ],
                    ),
                  ),
            Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Offline People",
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
            controller.offlineVendor.length != 0
                ? Expanded(
                    child: ListView.builder(
                        itemCount: controller.offlineVendor.length > 6
                            ? 6
                            : controller.offlineVendor.length,
                        itemBuilder: (context, index) => OfflineTranslattorCard(
                            name: controller.offlineVendor[index].name,
                            image: controller.offlineVendor[index].profilePic,
                            lang: controller.offlineVendor[index].language)),
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
