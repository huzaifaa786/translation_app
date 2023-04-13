import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:translation/screens/translator_screens/offline_translator/offline_people.dart';
import 'package:translation/static/offline_translator_card.dart';
import 'package:translation/static/online_translator_card.dart';
import 'package:translation/static/search_topbar.dart';

class Translator_ extends StatefulWidget {
  const Translator_({super.key});

  @override
  State<Translator_> createState() => _Translator_State();
}

class _Translator_State extends State<Translator_> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SearchTopBar(),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30,bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Online People",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) => OnlineTranslatorCard()
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Offline People",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OfflinePeople_screen()),
                      );
                    },
                    child: Text(
                      "View all",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => OfflineTranslattorCard()),
            ),
          ],
        ),
      ),
    );
  }
}
