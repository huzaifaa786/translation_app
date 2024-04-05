import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translation/static/countryList.dart';
import 'package:translation/values/colors.dart';

class SelectCurrencyAlert extends StatefulWidget {
  const SelectCurrencyAlert({Key? key});

  @override
  State<SelectCurrencyAlert> createState() => _SelectCurrencyAlertState();
}

class _SelectCurrencyAlertState extends State<SelectCurrencyAlert> {
  final List<Map<String, dynamic>> currency = [
    {
      'title': 'GBP - British Pound',
      'image': 'assets/images/United Arab Emirates.png'
    },
    {
      'title': 'USD - American Dollar',
      'image': 'assets/images/United Arab Emirates.png'
    },
    {
      'title': 'CAD - Canadian Dollar',
      'image': 'assets/images/United Arab Emirates.png'
    },
    {'title': 'EUR - Euro', 'image': null},
    {
      'title': 'AED - Emirati Dirham',
      'image': 'assets/images/United Arab Emirates.png'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: Get.width * 0.6,
        height: Get.height * 0.8,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, right: 10, left: 10),
              child: Text(
                "Choose Your Currency",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: greenish,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.4,
              child: ListView.builder(
                itemCount: currency.length,
                itemBuilder: (BuildContext context, int index) {
                  final String? image = currency[index]['image'];
                  return CountryList(
                    picture: image ?? 'default_image_url', // Provide a default image URL if null
                    countrycurrency: Text(currency[index]['title']),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
