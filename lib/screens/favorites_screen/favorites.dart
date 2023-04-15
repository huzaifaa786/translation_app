import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:translation/screens/main_screen/home.dart';
import 'package:translation/static/favorites_card.dart';
import 'package:translation/static/titletopbar.dart';

class Favorites_screen extends StatefulWidget {
  const Favorites_screen({super.key});

  @override
  State<Favorites_screen> createState() => _Favorites_screenState();
}

class _Favorites_screenState extends State<Favorites_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TitleTopbar(
              text: 'Favorites',
              ontap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 20,
            ),
             Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => FavoritesCard()),
            ),
          ],
        ),
      ),
    );
  }
}
