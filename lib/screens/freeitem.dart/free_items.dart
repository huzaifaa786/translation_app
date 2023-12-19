import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translation/static/titletopbar.dart';
import 'package:translation/values/colors.dart';
import 'package:translator/translator.dart';

class FreeItems extends StatefulWidget {
  const FreeItems({super.key});

  @override
  State<FreeItems> createState() => _FreeItemsState();
}

class _FreeItemsState extends State<FreeItems> {
  final translator = GoogleTranslator();
  String from = 'en';
  String to = 'ar';
  String data = 'مرحبًا';
  String selectedvalue = 'English';
  String selectedvalue2 = 'Arabic';
  TextEditingController controller = TextEditingController(text: 'Hello');
  final formkey = GlobalKey<FormState>();
  bool isloading = false;
  translate() async {
    try {
      if (formkey.currentState!.validate()) {
        await translator
            .translate(controller.text, from: from, to: to)
            .then((value) {
          data = value.text;
          isloading = false;
          setState(() {});
          // print(value);
        });
      }
    } on SocketException catch (_) {
      isloading = true;
      SnackBar mysnackbar = const SnackBar(
        content: Text('Internet not Connected'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(mysnackbar);
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleTopbar(
              text: 'Free item'.tr,
              ontap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('From:'.tr),
                  const SizedBox(
                    width: 100,
                  ),
                  DropdownButton(
                    value: selectedvalue,
                    focusColor: Colors.transparent,
                    underline: Container(color: Colors.grey.shade200),
                    items: languages.map((lang) {
                      return DropdownMenuItem(
                        value: lang,
                        child: Text(lang),
                        onTap: () {
                          int index = languages.indexOf(lang);
                          if (index != -1 && index < languagescode.length) {
                            from = languagescode[index];
                          }
                          setState(() {});
                        },
                      );
                    }).toList(),
                    onChanged: (value) {
                      selectedvalue = value!;
                    },
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey[400]!)),
              child: Form(
                key: formkey,
                child: TextFormField(
                  controller: controller,
                  maxLines: null,
                  minLines: null,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      errorStyle: TextStyle(color: Colors.white)),
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('To'.tr),
                  const SizedBox(
                    width: 100,
                  ),
                  DropdownButton(
                    value: selectedvalue2,
                    focusColor: Colors.transparent,
                    underline: Container(color: Colors.grey.shade200),
                    items: languages.map((lang) {
                      return DropdownMenuItem(
                        value: lang,
                        child: Text(lang),
                        onTap: () {
                          int index = languages.indexOf(lang);
                          if (index != -1 && index < languagescode.length) {
                            to = languagescode[index];
                          }
                          setState(() {});
                        },
                      );
                    }).toList(),
                    onChanged: (value) {
                      selectedvalue2 = value!;
                    },
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(25),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey[400]!)),
              child: Center(
                child: SelectableText(
                  data,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: translate,
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(greenish),
                    fixedSize: const MaterialStatePropertyAll(Size(300, 45))),
                child: isloading
                    ? const SizedBox.square(
                        dimension: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Text('Translate'.tr)),
            const SizedBox(
              height: 30,
            )
          ],
        )),
      ),
    );
  }

  List<String> languages = [
    "English",
    "Hindi",
    "Arabic",
    "German",
    "Russian",
    "Spanish",
    "Urdu",
    "Japanese",
    "Italian",
    "Mandarin Chinese",
    "French",
    "Portuguese",
    "Korean",
    "Malay",
    "Vietnamese",
    "Swahili",
    "Turkish",
    "Polish",
    "Dutch",
    "Thai",
    "Bengali",
    "Telugu",
    "Marathi",
    "Gujarati",
    "Persian",
    "Indonesian",
    "Burmese",
    "Tamil",
    "Ukrainian",
    "Romanian",
    "Czech",
    "Hungarian",
    "Swedish",
    "Danish",
    "Finnish",
    "Greek",
    "Hebrew",
    "Slovak",
    "Croatian",
    "Slovenian",
    "Serbian",
    "Bulgarian",
    "Latvian",
    "Lithuanian",
    "Estonian",
    "Georgian",
    "Armenian",
    "Kazakh",
    "Uzbek",
    "Azerbaijani",
    "Kyrgyz",
    "Turkmen",
    "Mongolian",
    "Tibetan",
    "Khmer",
    "Lao",
    "Tagalog",
    "Haitian Creole",
    "Amharic",
    "Zulu",
  ];

  List<String> languagescode = [
    "en",
    "hi",
    "ar",
    "de",
    "ru",
    "es",
    "ur",
    "ja",
    "it",
    "zh-Hans",
    "fr",
    "pt-BR",
    "ko",
    "ms",
    "vi",
    "sw",
    "tr",
    "pl",
    "nl",
    "th",
    "bn",
    "te",
    "mr",
    "gu",
    "fa",
    "id",
    "my",
    "ta",
    "uk",
    "ro",
    "cs",
    "hu",
    "sv",
    "da",
    "fi",
    "el",
    "he",
    "sk",
    "hr",
    "sl",
    "sr",
    "bg",
    "lv",
    "lt",
    "et",
    "ka",
    "hy",
    "kz",
    "uz",
    "az",
    "ky",
    "tk",
    "mn",
    "bo",
    "km",
    "lo",
    "tl",
    "ht",
    "am",
    "zu",
  ];
}
