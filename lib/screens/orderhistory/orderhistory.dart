import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:translation/static/historycard.dart';
import 'package:translation/static/titletopbar.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TitleTopbar(
            text: 'History',
            ontap: () {
              Navigator.pop(context);
            },
          ),
          Column(
            children: [
              HistoryCard(
                title: 'Order ID #34356',
                name: 'willom son',
                type: 'In person',
              ),
              HistoryCard(
                title: 'Order ID #34356',
                name: 'willom son',
                type: 'In person',
              ),
              HistoryCard(
                title: 'Order ID #34356',
                name: 'willom son',
                type: 'In person',
              ),
            ],
          )
        ],
      )),
    );
  }
}