import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/api/api.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/models/user.dart';
import 'package:translation/values/string.dart';

class GoogleServices {
  static googlelogin(String email) async {
    LoadingHelper.show();
    // var token = await FirebaseMessaging.instance.getToken();
    var url = BASE_URL + 'userget';
    var data = {'email': email};
    var response = await Api.execute(url: url, data: data);
    print(response);
    LoadingHelper.dismiss();
    if (!response['error']) {
      User user = User(response['data']);
      GetStorage box = GetStorage();
      box.write('api_token', user.apiToken!);
      box.write('user_id', user.id);
      return true;
    } else {
      return false;
    }
  }

  static googleSignup(name, email, type) async {
    LoadingHelper.show();
    var token = await FirebaseMessaging.instance.getToken();
    var url = BASE_URL + 'user/register';
    var data;
    data = {
      'username': name,
      'email': email.toString(),
      'firebase_token': token,
      // 'user_type': type,
    };

    var response = await Api.execute(
      url: url,
      data: data,
    );
    print('00000000000000000000000000000000000000000000001');
    print(response);
    LoadingHelper.dismiss();
    if (!response['error']) {
      User user = User(response['Vendor']);
      GetStorage box = GetStorage();
      await box.write('api_token', user.apiToken!);
      await box.write('user_id', user.id);
      print('jgfjfj64444444444444444444444444444444444444444444444444444');
      return true;
    } else {
      print('00000000000000000000000000000000000000000000002');
      print('error');
      return false;
    }
  }
}
