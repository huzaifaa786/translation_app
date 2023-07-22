import 'dart:convert';

import 'package:translation/models/service.dart';

class Vendor {
  String? id;
  String? name;
  String? username;
  String? apiToken;
  String? passport;
  String? number;
  String? profilePic;
  String? certificate;
  String? certificate_name;
  String? status;
  String? rating;
  int? online;
  String? aboutArabic;
  String? aboutEnglish;
  List<dynamic>? language;
  VendorService? service;

  Vendor(vendor) {
    id = vendor['id'];
    name = vendor['name'];
    username = vendor['username'];
    number = vendor['number'];
    apiToken = vendor['api_token'] ?? '';
    passport = vendor['passport'];
    number = vendor['number'] ?? '';
    certificate = vendor['certificate'] ?? '';
    certificate_name = vendor['certifcate_name'] ?? '';
    profilePic = vendor['profilepic'] ?? '';
    status = vendor['status'];
    rating = vendor['rating_avg_rating'];
    aboutArabic = vendor['about(arabic)'] ?? '';
    aboutEnglish = vendor['about(Eng)'] ?? '';
    online = vendor['online'];
    language = jsonDecode(vendor['language']);
    service =
        vendor['service'] != null ? VendorService(vendor['service']) : null;
  }
}
