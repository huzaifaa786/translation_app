class User {
  int? id;
  String? username;
  String? apiToken;
  String? number;
  String? email;
  String? currency;
  String? profilePic;
  String? type;
  int? isCompany;

  User(user) {
    id = user['id'];
    username = user['username'];
    number = user['phone'];
    currency =user['currency'];
    apiToken = user['api_token'] ?? '';
    email = user['email'];
    profilePic = user['profilepic'] ?? '';
    type = user['user_type'];
    isCompany = user['is_company'];
  }
}
