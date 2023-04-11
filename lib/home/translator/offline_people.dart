import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:translation/screens/translator_screens/translator_screen.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/static/large_button.dart';

class OfflinePeople_screen extends StatefulWidget {
  const OfflinePeople_screen({super.key});

  @override
  State<OfflinePeople_screen> createState() => _OfflinePeople_screenState();
}

class _OfflinePeople_screenState extends State<OfflinePeople_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 134,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 15.0, // soften the shadow
                  spreadRadius: 5.0, //extend the shadow
                  offset: Offset(
                    5.0, // Move to right 5  horizontally
                    5.0, // Move to bottom 5 Vertically
                  ),
                )
              ],
            ),
            margin: EdgeInsets.only(top: 0),
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Translator_()));
                    },
                    child: SvgPicture.asset("assets/icons/back.svg")),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Container(
                    width: 210,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[200],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search People',
                        contentPadding: EdgeInsets.only(left: 45),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 57,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xFF34607B),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // TODO: Implement search functionality
                    },
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Offline People",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 160,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OfflinePeople_screen()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 00),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(40),
                          ),
                        ),
                        builder: (context) => Wrap(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 40, 0, 40),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 50.0),
                                      child: const Text(
                                        "Filters",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 180,
                                    ),
                                    Text("Clear")
                                  ],
                                ),
                              ),
                              Center(
                                child: SizedBox(
                                  width: 325.68,
                                  child: DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      labelText: "Filter By",
                                      //Add isDense true and zero Padding.
                                      //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      //Add more decoration as you want here
                                      //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                                    ),
                                    isExpanded: true,
                                    hint: const Text(
                                      'Highest price to lowest price',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    items: genderItems
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
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Please select gender.';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      //Do something when changing the item if you want.
                                    },
                                    onSaved: (value) {
                                      // selectedValue = value.toString();
                                    },
                                    buttonStyleData: const ButtonStyleData(
                                      height: 60,
                                      padding:
                                          EdgeInsets.only(left: 20, right: 10),
                                    ),
                                    iconStyleData: const IconStyleData(
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black45,
                                      ),
                                      iconSize: 30,
                                    ),
                                    dropdownStyleData: DropdownStyleData(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 90,
                              ),
                              const SizedBox(height: 30),
                              Center(
                                child: SizedBox(
                                  width: 325.68,
                                  child: DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      labelText: "Filter By",
                                      //Add isDense true and zero Padding.
                                      //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      //Add more decoration as you want here
                                      //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                                    ),
                                    isExpanded: true,
                                    hint: const Text(
                                      'Highest price to lowest price',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    items: genderItems
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
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Please select gender.';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      //Do something when changing the item if you want.
                                    },
                                    onSaved: (value) {
                                      // selectedValue = value.toString();
                                    },
                                    buttonStyleData: const ButtonStyleData(
                                      height: 60,
                                      padding:
                                          EdgeInsets.only(left: 20, right: 10),
                                    ),
                                    iconStyleData: const IconStyleData(
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black45,
                                      ),
                                      iconSize: 30,
                                    ),
                                    dropdownStyleData: DropdownStyleData(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 95,
                              ),
                              Center(
                                  child: LargeButton(
                                title: 'Filter',
                                sreenRatio: 0.8,
                                onPressed: () {
                                  setState(() {});
                                  // authController.signIn();
                                  // Navigator.pushNamed(context, 'home');
                                },
                                color: greenish,
                                textcolor: Colors.white,
                                buttonWidth: 0.95,
                              )),
                              SizedBox(
                                height: 80,
                              )
                            ]),
                      );
                    },
                    child: Text(
                      "Filter",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => Container(
                      height: 117,
                      width: 361,
                      padding: EdgeInsets.all(5),
                      child: Card(
                        color: Color.fromARGB(255, 255, 255, 255),
                        // ignore: sort_child_properties_last
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              width: 68,
                              height: 68,
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: Color(0xFF34607B)),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(22),
                                child: SvgPicture.asset(
                                  "assets/images/splash_1.svg",
                                  width: 64,
                                  height: 64,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 8, 55, 0),
                                  child: const Text(
                                    "Theresea Webb",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 4, 28, 0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Rate per 30 mins:  ",
                                        style: TextStyle(
                                            fontSize: 9,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "100 AED",
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 110.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.star,
                                          color: Colors.yellow, size: 11),
                                      SizedBox(width: 5),
                                      Text('5.0',
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.24),
                                            width: 1),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        'Arabic',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.24),
                                            width: 1),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        'Turkish',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.24),
                                            width: 1),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        'English',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            SvgPicture.asset("assets/icons/forward.svg"),
                          ],
                        ),
                        elevation: 7,
                        shadowColor: Color.fromARGB(255, 63, 63, 63),
                        margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}

final List<String> genderItems = [
  'Male',
  'Female',
];
