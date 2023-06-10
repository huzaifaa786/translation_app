import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({super.key, this.rating, this.name, this.image});
  final name;
  final rating;
  final image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(8),
          width: 98,
          height: 98,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Color(0xFF34607B)),
            borderRadius: BorderRadius.circular(70),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(45),
            child: image == ''
                ? Image.asset(
                    "assets/images/5907.jpg",
                    fit: BoxFit.cover,
                  )
                : CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        Text(
          name,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
                fit: BoxFit.scaleDown,
                child: SvgPicture.asset('assets/images/star.svg',
                    height: 11, width: 11)),
            Padding(
              padding: const EdgeInsets.only(top: 4, left: 2),
              child: Text(rating == null ? '0.0' : rating.toString(),
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ],
    );
  }
}
