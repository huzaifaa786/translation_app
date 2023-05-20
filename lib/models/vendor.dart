import 'dart:convert';

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
  List<dynamic>? language;

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
    online = vendor['online'];
    language = jsonDecode(vendor['language']);
  }
}
