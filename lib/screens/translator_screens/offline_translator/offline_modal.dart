import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:translation/static/large_button.dart';
import 'package:translation/values/colors.dart';

class FilterModal extends StatelessWidget {
  const FilterModal({super.key, this.rating, this.price});
  final rating;
  final price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 20.0, right: 20, top: 30, bottom: 40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Filters",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              Text("Clear",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: greenish))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: DropdownButtonFormField2(
              decoration: InputDecoration(
                labelText: "Filter By",
                labelStyle: TextStyle(),
                contentPadding: EdgeInsets.only(left: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              isExpanded: true,
              hint: const Text(
                'Highest price to lowest price',
                style: TextStyle(fontSize: 14),
              ),
              items: price,
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
                padding: EdgeInsets.only(left: 20, right: 10),
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
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: DropdownButtonFormField2(
              decoration: InputDecoration(
                labelText: "Filter By",
                contentPadding: EdgeInsets.only(left: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              isExpanded: true,
              hint: const Text(
                'Highest price to lowest price',
                style: TextStyle(fontSize: 14),
              ),
              items: rating,
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
                padding: EdgeInsets.only(left: 20, right: 10),
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
          LargeButton(
            title: 'Filter',
            sreenRatio: 0.9,
            onPressed: () {},
            color: greenish,
            textcolor: Colors.white,
            buttonWidth: 0.95,
          ),
        ],
      ),
    );
  }
}
