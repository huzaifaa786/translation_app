import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchTopBar extends StatelessWidget {
  const   SearchTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 15.0,
              spreadRadius: 5.0,
              offset: Offset(5.0, 5.0))
        ],
      ),
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: SvgPicture.asset('assets/icons/back.svg',
                    height: 40, width: 40),
              )),
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
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey[300]!),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey[300]!),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  hintText: 'Search People',
                  contentPadding: EdgeInsets.only(left: 12),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
          ),
          Container(
            width: 57,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xFF34607B),
            ),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
