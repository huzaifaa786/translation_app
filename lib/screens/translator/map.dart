import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:translation/models/vendor.dart';
import 'dart:math' as math;
import 'package:translation/static/large_button.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/values/controllers.dart';

class DeliveryMap extends StatefulWidget {
  const DeliveryMap(this.vendor);
  final Vendor? vendor;
  @override
  _DeliveryMapState createState() => _DeliveryMapState();
}

class _DeliveryMapState extends State<DeliveryMap> {
  LatLng? selectedLocation;

  @override
  Widget build(BuildContext context) {
    LatLng deliveryAreaCenter = LatLng(
        double.parse(widget.vendor!.service!.lat!),
        double.parse(widget.vendor!.service!.lng!));
    double deliveryAreaRadius = double.parse(widget.vendor!.service!.radius!);
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
        title: Text('Choose location'),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn2",
        backgroundColor: greenish,
        onPressed: () {
          if (selectedLocation != null) {
            translatorProfileController.selectedLocation = selectedLocation;
            setState(() {});
            Get.back();
            Get.snackbar(
              'Selected',
              'Loaction Selected Successfully.',
              colorText: white,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: greenish,
            );
            return;
          } else {
            Get.snackbar(
              "Empty!",
              'Please Select Area first before saving range.',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.save, size: 20, color: Colors.white),
            Text(
              "Save",
              style: TextStyle(fontSize: 9, color: Colors.white),
            )
          ],
        ),
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
    const int radiusOfEarth = 6371000;
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
