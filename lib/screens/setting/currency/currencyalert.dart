import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/api/currencyapi.dart';
import 'package:translation/screens/main_screen/home.dart';
import 'package:translation/screens/profile/profile.dart';
import 'package:translation/screens/setting/currency/currency_controller.dart';
import 'package:translation/screens/setting/settingcontroller.dart';
import 'package:translation/static/countryList.dart';
import 'package:translation/values/colors.dart';
import 'package:forex_conversion/forex_conversion.dart';

class Currency extends StatefulWidget {
  const Currency({Key? key});

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  final SettingController controller = Get.find();
  GetStorage box = GetStorage();
  final fx = Forex();

  saveSelectedcurrency(String currency) {
    box.write("selectedCurrency", currency);
  }

  String? selectedCurrency;

  final List<Map<String, dynamic>> currency = [
    {'title': 'GBP', 'image': 'assets/images/Great Britain.png'},
    {'title': 'USD', 'image': 'assets/images/Usa.png'},
    {'title': 'CAD', 'image': 'assets/images/Canada.png'},
    {'title': 'EUR', 'image': "assets/images/European Union Circular Flag.png"},
    {'title': 'AED', 'image': 'assets/images/United Arab Emirates.png'}
  ];

  @override
  void initState() {
    super.initState();
    loadSelectedCurrency();
    currencyrata();
  }

  void loadSelectedCurrency() {
    setState(() {
      selectedCurrency = box.read("selectedCurrency");
    });
  }

  currencyrata() async {
    var allPrices = await fx.getCurrencyConverted(
        sourceCurrency: "AED", destinationCurrency: "PKR", sourceAmount: 2);
    print('gggggggggggggggggggggggg');
    print(allPrices);
  }

  RxBool isLoading = false.obs;
  final apiService = ApiService();
  Future<void> updateSelectedCurrency() async {
    var Currency = selectedCurrency;

    try {
      final response = await ApiService().storeCurrency(Currency.toString());
      if (response.data['user'] != null) {
        print(response.data);
        Get.offAll(() => Home_screen());
      }

      // update(selectedCurrency as List<Object>?);
    } on Exception catch (error) {
      isLoading.value = false;
    }
  }

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
                "Choose Your Currency".tr,
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
                    value: countryCurrency,
                    picture: image ?? 'assets/images/Great Britain.png',
                    countrycurrency: countryCurrency,
                    groupvalue: selectedCurrency,
                    onchaged: (dynamic newValue) {
                      setState(() {
                        selectedCurrency = newValue;
                        saveSelectedcurrency(newValue!);
                      });
                      updateSelectedCurrency();
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
