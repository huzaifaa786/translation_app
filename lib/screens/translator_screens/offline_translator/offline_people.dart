import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/models/filter.dart';
import 'package:translation/models/service.dart';
import 'package:translation/screens/main_screen/homecontroller.dart';
import 'package:translation/screens/setting/settingcontroller.dart';
import 'package:translation/screens/translator_screens/offline_translator/offline_modal.dart';
import 'package:translation/static/offline_translator_card.dart';
import 'package:translation/static/search_topbar.dart';
import 'package:translation/static/titletopbar.dart';
import 'package:translation/values/controllers.dart';
import 'package:forex_conversion/forex_conversion.dart';

class OfflinePeople_screen extends StatefulWidget {
  OfflinePeople_screen({super.key});

  @override
  State<OfflinePeople_screen> createState() => _OfflinePeople_screenState();
}

class _OfflinePeople_screenState extends State<OfflinePeople_screen> {
  SettingController currencycontroller = Get.find();
  GetStorage box = GetStorage();
  String? selectedCurrency;
  String? currency;

  @override
  void initState() {
    selectedCurrency = box.read('currency');
    setState(() {});
    super.initState();
  }

  FilterModalResult? query;
  // @override
  // void initState() {
  //   homeController.sofflineVendor = homeController.offlineVendor;
  //   setState(() {});
  //   super.initState();
  // }

  // currencyrata() async {
  //   var allPrices =
  //   print('gggggggggggggggggggggggg');
  //   print(allPrices);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<HomeController>(
          builder: (controller) => Column(
            children: [
              TitleTopbar(
                text: "Interpreters / Translators".tr,
                height: 0.13,
              ),
              // SearchTopBar(
              //   onchange: controller.searchOfflineOrders,
              // ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 15, bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: Get.width * 0.8,
                      // height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[200],
                      ),
                      child: TextField(
                        onChanged: controller.searchOfflineOrders,
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
                    GestureDetector(
                      onTap: () async {
                        query = await showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(40),
                            ),
                          ),
                          builder: (context) => Wrap(children: [
                            FilterModal(
                                rating: rating
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item.tr,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                price: price
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item.tr,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                    .toList())
                          ]),
                        );
                        if (query != null) {
                          if (query!.price != '') {
                            homeController.filterOfflineOrder(
                                query!.rating, query!.price);
                          } else if (query!.rating != '') {
                            homeController.filterOfflineOrder(
                                query!.rating, query!.price);
                          } else {
                            homeController.filterOfflineOrder(
                                query!.rating, query!.price);
                          }
                        }
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Image.asset(
                              'assets/images/Filter.png',
                              height: 28,
                              width: 28,
                            ),
                          ),
                          // Text(
                          //   "Filter".tr,
                          //   style: TextStyle(
                          //       fontSize: 16, fontWeight: FontWeight.w600),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              controller.sschedule.length != 0
                  ? Expanded(
                      child: ListView.builder(
                          itemCount: controller.sschedule.length,
                          itemBuilder: (context, index) {
                            return OfflineTranslattorCard(
                              currencyname: selectedCurrency,
                              name: controller.sschedule[index].name,
                              image: controller.sschedule[index].profilePic,
                              lang: controller.sschedule[index].language,
                              vendor: controller.sschedule[index],
                              price: controller
                                  .sschedule[index].service!.audiovideo,
                              rating: controller.sschedule[index].rating == null
                                  ? null
                                  : double.parse(
                                      controller.sschedule[index].rating!),
                            );
                          }),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

final List<String> price = [
  'Highest price to lowest price',
  'lowest to Highest price',
];

final List<String> rating = [
  'Highest to lowest rating',
  'lowest to highest rating',
];
