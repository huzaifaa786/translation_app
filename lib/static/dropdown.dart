import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:gap/gap.dart';
import 'package:translation/values/colors.dart';

class DropdownField extends StatelessWidget {
  const DropdownField({
    Key? key,
    this.controller,
    this.selectedvalue,
    this.text,
    this.icon,
    this.imageIcon,
    this.color = greenish,
    this.items,
    this.maxlines = false,
    this.onChange,
    this.type = TextInputType.text,
    this.onpressed,
    this.searchController,
    this.searchInnerWidget,
    this.searchMatchFn,
    this.onMenuStateChange,
  }) : super(key: key);

  final controller;
  final List? items;
  final selectedvalue;
  final type;
  final text;
  final icon;
  final imageIcon;
  final color;
  final maxlines;
  final onChange;
  final onpressed;

  // Searchable dropdown specific parameters
  final TextEditingController? searchController;
  final Widget? searchInnerWidget;
  final bool Function(dynamic item, String searchValue)? searchMatchFn;
  final void Function(bool isOpen)? onMenuStateChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          hint: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
                color: hintText,
              ),
            ),
          ),
          items: items!
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Wrap(
                      children: [
                        Center(
                          child: Text(
                            item.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: greenish,
                        ),
                      ],
                    ),
                  ))
              .toList(),
          value: selectedvalue,
          onChanged: (value) {
            onChange(value);
          },
          buttonStyleData: ButtonStyleData(
            height: 45,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 12, right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                width: 0.6,
                color: greenish,
              ),
              color: white,
            ),
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          iconStyleData:
              IconStyleData(icon: Image.asset('assets/images/drop_arrow.png')),
          dropdownSearchData: DropdownSearchData(
              searchController: searchController,
              searchInnerWidget: searchInnerWidget,
              searchMatchFn: searchMatchFn,
              searchInnerWidgetHeight: 70),
          onMenuStateChange: onMenuStateChange,
        ),
      ),
    );
  }
}
