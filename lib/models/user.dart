import 'dart:convert';

class User {
  int? id;
  String? username;
  String? apiToken;
  String? number;
  String? email;

  User(user) {
    id = user['id'];
    username = user['username'];
    number = user['phone'];
    apiToken = user['api_token'] ?? '';
    email = user['email'];
  }
}
