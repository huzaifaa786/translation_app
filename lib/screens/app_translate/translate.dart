import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/screens/app_translate/translate_method.dart';
import 'dart:ui' as ui;
import 'package:get/get.dart';
import 'package:translation/static/titletopbar.dart';

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({super.key, this.lang});

  final String? lang;

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

enum translateMethod { English, Arabic }

class _TranslateScreenState extends State<TranslateScreen> {
  translateMethod? _site;
  toggleplan(translateMethod value) {
    setState(() {
      _site = value;
    });
  }

  @override
  void initState() {
    print(Get.locale);
    _site = Get.locale != Locale('ar', 'AE')
        ? translateMethod.English
        : translateMethod.Arabic;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: ui.TextDirection.ltr,
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: TitleTopbar(
                ontap: () {
                  Get.back();
                },
                text: 'language'.tr,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  TranslateMethod(
                    title: 'english'.tr,
                    groupvalue: _site,
                    value: translateMethod.English,
                    onchaged: () async {
                      await toggleplan(translateMethod.English);
                      Get.updateLocale(const Locale('en', 'US'));
                      GetStorage box = GetStorage();
                      await box.write('locale', 'en');
                      box.read('locale');
                      print(box.read('locale'));
                      setState(() {});
                    },
                  ),
                  TranslateMethod(
                    title: 'arabic'.tr,
                    groupvalue: _site,
                    value: translateMethod.Arabic,
                    onchaged: () async {
                      await toggleplan(translateMethod.Arabic);
                      Get.updateLocale(const Locale('ar', 'AE'));
                      GetStorage box = GetStorage();
                      await box.write('locale', 'ar');
                      box.read('locale');
                      setState(() {});
                    },
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
