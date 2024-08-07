import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/screens/main_screen/homecontroller.dart';
import 'package:translation/screens/setting/settingcontroller.dart';
import 'package:translation/screens/translator_screens/offline_translator/offline_people.dart';
import 'package:translation/screens/translator_screens/online_translator/online_people.dart';
import 'package:translation/static/offline_translator_card.dart';
import 'package:translation/static/online_translator_card.dart';
import 'package:translation/static/search_topbar.dart';
import 'package:translation/static/titletopbar.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/values/controllers.dart';

class Translator_ extends StatefulWidget {
  const Translator_({super.key});

  @override
  State<Translator_> createState() => _Translator_State();
}

class _Translator_State extends State<Translator_> {
  SettingController currencycontroller = Get.find();
  GetStorage box = GetStorage();
  String? selectedCurrency;
  @override
  void initState() {
    selectedCurrency = box.read('currency');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          child: GetBuilder<HomeController>(
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleTopbar(
              text: "Interpreters / Translators".tr,
            ),
            // Container(
            //   decoration :BoxDecoration(color: greenish),
            //   child:Column(children: [

            //   ],) ,),
            // SearchTopBar(
            //   onchange: homeController.searchVendors,
            // ),
            // homeController.sonlineVendor.length != 0
            //     ? Padding(
            //         padding: const EdgeInsets.only(
            //             left: 12, right: 12, top: 16, bottom: 12),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Container(
            //               margin: EdgeInsets.only(left: 10, right: 30),
            //               width: Get.width * 0.3,
            //               // height: 70,
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(12),
            //                 color: Colors.grey[200],
            //               ),
            //               child: TextField(
            //                 onChanged: homeController.searchVendors,
            //                 decoration: InputDecoration(
            //                   enabledBorder: OutlineInputBorder(
            //                     borderSide: BorderSide(
            //                         width: 1, color: Colors.grey[300]!),
            //                     borderRadius:
            //                         BorderRadius.all(Radius.circular(10)),
            //                   ),
            //                   focusedBorder: OutlineInputBorder(
            //                     borderSide: BorderSide(
            //                         width: 1, color: Colors.grey[300]!),
            //                     borderRadius:
            //                         BorderRadius.all(Radius.circular(13)),
            //                   ),
            //                   prefixIcon: Icon(Icons.search),
            //                   hintText: 'Search'.tr,
            //                   contentPadding:
            //                       EdgeInsets.only(left: 12, right: 13),
            //                   fillColor: Colors.white,
            //                   filled: true,
            //                 ),
            //               ),
            //             ),
            //             // Text(
            //             //   "Online Translators/interpreters".tr,
            //             //   style: TextStyle(
            //             //       fontSize: 16,
            //             //       fontWeight: FontWeight.w600,
            //             //       fontFamily: 'Poppins'),
            //             // ),
            //             GestureDetector(
            //               onTap: () {
            //                 Get.to(() => OnlinePeople_screen())!.then((value) {
            //                   homeController.onlineVendorUpdate();
            //                 });
            //               },
            //               child: Text(
            //                 "View All".tr,
            //                 style: TextStyle(
            //                     fontSize: 14,
            //                     fontFamily: 'Poppins',
            //                     color: Colors.grey[600]),
            //               ),
            //             ),
            //           ],
            //         ),
            //       )
            //     : Container(),
            // homeController.sonlineVendor.length != 0
            //     ? Container(
            //         padding: EdgeInsets.only(left: 10),
            //         height: MediaQuery.of(context).size.height * 0.26,
            //         child: ListView.builder(
            //             scrollDirection: Axis.horizontal,
            //             shrinkWrap: true,
            //             itemCount: homeController.sonlineVendor.length > 6
            //                 ? 6
            //                 : homeController.sonlineVendor.length,
            //             itemBuilder: (context, index) => OnlineTranslatorCard(
            //                   name: homeController.sonlineVendor[index].name,
            //                   image: homeController
            //                       .sonlineVendor[index].profilePic,
            //                   rating:
            //                       homeController.sonlineVendor[index].rating ==
            //                               null
            //                           ? null
            //                           : double.parse(homeController
            //                               .sonlineVendor[index].rating!),
            //                   vendor: homeController.sonlineVendor[index],
            //                   price: homeController.sonlineVendor[index]
            //                       .service!.onlineaudiovideoPrice,
            //                 )),
            //       )
            //     : Container(),
            Padding(
              padding:
                  EdgeInsets.only(left: 12, right: 12, top: 16, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    width: Get.width * 0.75,
                    // height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[200],
                    ),
                    child: TextField(
                      onChanged: homeController.searchVendors,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.grey[300]!),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.grey[300]!),
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                        ),
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search'.tr,
                        contentPadding: EdgeInsets.only(left: 12, right: 13),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),

                  // Text(
                  //   "Schedule Translators/interpreters".tr,
                  //   style: TextStyle(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       fontFamily: 'Poppins'),
                  // ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => OfflinePeople_screen())!.then((value) {
                        homeController.offlineVendorUpdate();
                      });
                    },
                    child: Text(
                      "View All".tr,
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
                ? ListView.builder(
                    itemCount: homeController.sschedule.length > 6
                        ? 6
                        : homeController.sschedule.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => OfflineTranslattorCard(
                          currencyname: selectedCurrency,
                          name: homeController.sschedule[index].name,
                          image: homeController.sschedule[index].profilePic,
                          lang: homeController.sschedule[index].language,
                          vendor: homeController.sschedule[index],
                          price: homeController
                              .sschedule[index].service!.audiovideo,
                          rating: homeController.sschedule[index].rating == null
                              ? null
                              : double.parse(
                                  homeController.sschedule[index].rating!),
                        ))
                : Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("No Translator Found!".tr),
                      ],
                    ),
                  )
          ],
        ),
      )),
    );
  }
}
