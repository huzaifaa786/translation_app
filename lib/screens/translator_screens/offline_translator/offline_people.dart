import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:translation/screens/translator_screens/offline_translator/offline_modal.dart';
import 'package:translation/screens/translator_screens/translator_screen.dart';
import 'package:translation/static/offline_translator_card.dart';
import 'package:translation/static/search_topbar.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/static/large_button.dart';
import 'package:translation/values/controllers.dart';

class OfflinePeople_screen extends StatefulWidget {
  const OfflinePeople_screen({super.key});

  @override
  State<OfflinePeople_screen> createState() => _OfflinePeople_screenState();
}

class _OfflinePeople_screenState extends State<OfflinePeople_screen> {
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
                    "Offline People",
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
                  itemCount: homeController.offlineVendor.length,
                  itemBuilder: (context, index) => OfflineTranslattorCard(
                        name: homeController.offlineVendor[index].name,
                        image: homeController.offlineVendor[index].profilePic,
                        lang: homeController.offlineVendor[index].language,
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
