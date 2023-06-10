import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' as math;

import 'package:translation/static/large_button.dart';
import 'package:translation/values/colors.dart';

class DeliveryMap extends StatefulWidget {
  @override
  _DeliveryMapState createState() => _DeliveryMapState();
}

class _DeliveryMapState extends State<DeliveryMap> {
  LatLng deliveryAreaCenter = LatLng(32.0999459, 72.7076235);
  double deliveryAreaRadius = 5000.0;
  LatLng? selectedLocation;

  @override
  Widget build(BuildContext context) {
    Set<Circle> circles = Set.from([
      Circle(
        circleId: CircleId('circle'),
        center: deliveryAreaCenter,
        radius: deliveryAreaRadius,
        fillColor: Colors.blue.withOpacity(0.3),
        strokeWidth: 2,
        strokeColor: Colors.blue,
      ),
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Metting Location'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: deliveryAreaCenter,
          zoom: 12.0,
        ),
        zoomControlsEnabled: false,
        circles: circles,
        onTap: (LatLng location) {
          final distance = calculateDistance(deliveryAreaCenter, location);
          if (distance <= deliveryAreaRadius) {
            setState(() {
              selectedLocation = location;
            });
            print(selectedLocation);
            // Location is within the allowed area, proceed with delivery
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/group.svg",
                        width: 60,
                        height: 60,
                      ),
                    ],
                  ),
                  content: Text(
                    'Sorry! Interpreter not within your range.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 19),
                  ),
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(right: 20, left: 20, bottom: 10),
                      child: LargeButton(
                          title: 'Ok',
                          onPressed: () {
                            Get.back();
                          },
                          color: greenish),
                    )
                  ],
                );
              },
            );
          }
        },
        markers: {
          if (selectedLocation != null)
            Marker(
              markerId: MarkerId('selected_location'),
              position: selectedLocation!,
            ),
        },
      ),
    );
  }

  double calculateDistance(LatLng point1, LatLng point2) {
    const int radiusOfEarth = 6371000; // meters
    final double lat1 = _radians(point1.latitude);
    final double lon1 = _radians(point1.longitude);
    final double lat2 = _radians(point2.latitude);
    final double lon2 = _radians(point2.longitude);
    final double dlon = lon2 - lon1;
    final double dlat = lat2 - lat1;
    final double a = math.pow(math.sin(dlat / 2), 2) +
        math.cos(lat1) * math.cos(lat2) * math.pow(math.sin(dlon / 2), 2);
    final double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    final double distance = radiusOfEarth * c;
    return distance;
  }

  double _radians(double degrees) {
    return degrees * math.pi / 180;
  }
}
