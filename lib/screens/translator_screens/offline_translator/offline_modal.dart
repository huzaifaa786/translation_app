import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translation/models/filter.dart';
import 'package:translation/static/large_button.dart';
import 'package:translation/values/colors.dart';

class FilterModal extends StatefulWidget {
  const FilterModal({super.key, this.rating, this.price});
  final rating;
  final price;

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  String? selectedPrice;
  String? selectedRating;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20.0, right: 20, top: 30, bottom: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Filters".tr,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                // Text("Clear",
                //     style: TextStyle(
                //         fontSize: 16,
                //         fontWeight: FontWeight.w700,
                //         color: greenish))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: DropdownButtonFormField2(
                decoration: InputDecoration(
                  labelText: "Filter By".tr,
                  labelStyle: TextStyle(),
                  contentPadding: EdgeInsets.only(left: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                isExpanded: true,
                hint:  Text(
                  'Select Option'.tr,
                  style: TextStyle(fontSize: 14),
                ),
                items: widget.price,
                validator: (value) {
                  if (value == null) {
                    return 'Please select option.';
                  }
                  return null;
                },
                onChanged: (value) {
                  selectedPrice = value.toString();
                },
                onSaved: (value) {},
                buttonStyleData: const ButtonStyleData(
                  height: 60,
                  padding: EdgeInsets.only(right: 10),
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
                  labelText: "Filter By".tr,
                  contentPadding: EdgeInsets.only(left: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                isExpanded: true,
                hint: Text(
                  'Select Option'.tr,
                  style: TextStyle(fontSize: 14),
                ),
                items: widget.rating,
                validator: (value) {
                  if (value == null) {
                    return 'Please select option.';
                  }
                  return null;
                },
                onChanged: (value) {
                  selectedRating = value.toString();
                },
                onSaved: (value) {},
                buttonStyleData: const ButtonStyleData(
                  height: 60,
                  padding: EdgeInsets.only(right: 10),
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
              title: 'Filter'.tr,
              sreenRatio: 0.9,
              onPressed: () {
                FilterModalResult query = FilterModalResult(
                    selectedPrice == null ? '' : selectedPrice!,
                    selectedRating == null ? '' : selectedRating!);
                Get.back(result: query);
              },
              color: greenish,
              textcolor: Colors.white,
              buttonWidth: 0.95,
            ),
          ],
        ),
      ),
    );
  }
}
