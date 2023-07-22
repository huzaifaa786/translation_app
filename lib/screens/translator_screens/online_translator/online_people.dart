import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:translation/models/filter.dart';
import 'package:translation/screens/main_screen/homecontroller.dart';
import 'package:translation/screens/translator_screens/offline_translator/offline_modal.dart';
import 'package:translation/static/offline_translator_card.dart';
import 'package:translation/static/search_topbar.dart';
import 'package:translation/values/controllers.dart';

class OnlinePeople_screen extends StatefulWidget {
  const OnlinePeople_screen({super.key});

  @override
  State<OnlinePeople_screen> createState() => _OnlinePeople_screenState();
}

class _OnlinePeople_screenState extends State<OnlinePeople_screen> {
  FilterModalResult? query;
  @override
  void initState() {
    homeController.sonlineVendor = homeController.onlineVendor;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<HomeController>(
          builder: (controller) => Column(
            children: [
              SearchTopBar(
                onchange: homeController.searchOnlineOrders,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 30, bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Online translators / interpreters",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                                            item,
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
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                    .toList())
                          ]),
                        );
                        if (query!.price != '') {
                          homeController.filterOnlineOrder(
                              query!.rating, query!.price);
                        } else if (query!.rating != '') {
                          homeController.filterOnlineOrder(
                              query!.rating, query!.price);
                        } else {
                          homeController.filterOnlineOrder(
                              query!.rating, query!.price);
                        }
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: SvgPicture.asset(
                                'assets/images/filterIcon.svg'),
                          ),
                          Text(
                            "Filter",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              homeController.sonlineVendor.length != 0
                  ? Expanded(
                      child: ListView.builder(
                          itemCount: homeController.sonlineVendor.length,
                          itemBuilder: (context, index) =>
                              OfflineTranslattorCard(
                                name: homeController.sonlineVendor[index].name,
                                image: homeController
                                    .sonlineVendor[index].profilePic,
                                lang: homeController
                                    .sonlineVendor[index].language,
                                vendor: homeController.sonlineVendor[index],
                                price: homeController.sonlineVendor[index]
                                    .service!.onlineaudiovideoPrice,
                                rating: homeController
                                            .sonlineVendor[index].rating ==
                                        null
                                    ? null
                                    : double.parse(homeController
                                        .sonlineVendor[index].rating!),
                              )),
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
  'lowest price to Highest price',
];

final List<String> rating = [
  'Highest to lowest rating',
  'lowest to Highest rating',
];
