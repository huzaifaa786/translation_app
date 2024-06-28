import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translation/static/dropdown.dart';
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
  TextEditingController searchController = TextEditingController();
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
          // mainAxisAlignment: MainAxisAlignment.,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            TitleTopbar(
              text: 'Free item'.tr,
              ontap: () {
                Navigator.pop(context);
              },
              height: 0.2 / 1.4,
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'From'.tr,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: DropdownField(
                selectedvalue: selectedvalue,
                text: 'Select a language',
                items: languages,
                onChange: (value) {
                  int index = languages.indexOf(value);
                  if (index != -1 && index < languagescode.length) {
                    from = languagescode[index];
                  }
                  setState(() {
                    selectedvalue = value;
                  });
                },
                // Add the following for search functionality
                searchController: searchController,
                searchInnerWidget: Container(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 14,
                      ),
                      hintText: 'Search items'.tr,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                searchMatchFn: (item, searchValue) {
                  return (item.value
                      .toLowerCase()
                      .contains(searchValue.toLowerCase()));
                },
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    searchController.clear();
                  }
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200,
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
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'To'.tr,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: DropdownField(
                selectedvalue: selectedvalue2,
                text: 'Select a language',
                items: languages, // Replace with your list of languages
                onChange: (value) {
                  int index = languages.indexOf(value);
                  if (index != -1 && index < languagescode.length) {
                    to = languagescode[index];
                  }
                  setState(() {
                    selectedvalue2 = value;
                  });
                },
                searchController: searchController,
                searchInnerWidget: Container(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 14,
                      ),
                      hintText: 'Search items'.tr,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                searchMatchFn: (item, searchValue) {
                  return (item.value
                      .toLowerCase()
                      .contains(searchValue.toLowerCase()));
                },
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    searchController.clear();
                  }
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(25),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
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
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
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
            ),
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
