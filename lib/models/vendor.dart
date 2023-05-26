import 'dart:convert';
import 'dart:developer';

import 'package:translation/models/service.dart';

class Vendor {
  int? id;
  String? name;
  String? username;
  String? apiToken;
  String? passport;
  String? number;
  String? profilePic;
  String? certificate;
  String? status;
  int? online;
  int? rating;
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
    profilePic = vendor['profilepic'] ?? '';
    status = vendor['status'];
    rating = vendor['rating'];
    online = vendor['online'];
    language = jsonDecode(vendor['language']);
    service =  VendorService(vendor['service']) ;
  }
}