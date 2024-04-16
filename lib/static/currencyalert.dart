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
 
  

   String? selectedCurrency;

  final List<Map<String, dynamic>> currency = [
    {
      'title': 'GBP - British Pound',
      'image': 'assets/images/Great Britain.png'
    },
    {'title': 'USD - American Dollar', 'image': 'assets/images/Usa.png'},
    {'title': 'CAD - Canadian Dollar', 'image': 'assets/images/Canada.png'},
    {
      'title': 'EUR - Euro',
      'image': "assets/images/European Union Circular Flag.png"
    },
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
        height: Get.height * 0.6,
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
                  final String countryCurrency = currency[index]['title'];
                  return CountryList(
                    picture: image ?? 'assets/images/Great Britain.png',
                    countrycurrency: countryCurrency,
                    groupvalue:selectedCurrency ,
                    value: countryCurrency,
                    onchaged: () {
                      setState(() {
                         selectedCurrency = countryCurrency;
                        
                      });
                    },
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
