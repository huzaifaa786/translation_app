import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
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
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child:
                              SvgPicture.asset('assets/images/filterIcon.svg'),
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
            Expanded(
              child: ListView.builder(
                  itemCount: homeController.onlineVendor.length,
                  itemBuilder: (context, index) => OfflineTranslattorCard(
                        name: homeController.onlineVendor[index].name,
                        image: homeController.onlineVendor[index].profilePic,
                        lang: homeController.onlineVendor[index].language,
                        vendor: homeController.onlineVendor[index],
                        price: homeController
                            .onlineVendor[index].service!.onlineaudiovideoPrice,
                        rating: homeController.onlineVendor[index].rating,
                      )),
            ),
          ],
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
