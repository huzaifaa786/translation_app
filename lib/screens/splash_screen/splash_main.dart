import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/api/api.dart';
import 'package:translation/screens/auth/login_screen.dart';
import 'package:translation/screens/main_screen/home.dart';
import 'package:translation/screens/splash_screen/splash_screen1.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/values/string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  Future<String?> fetchCountryFromIP() async {
    const url = 'http://ip-api.com/json';

    try {
      var response = await Api.execute(url: url, data: {});

      if (response != null && response['status'] == 'success') {
        return response['country'];
      } else {
        return 'Failed to get country';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }

  storeCountryToGetTimeZone(country) async {
    const url = BASE_URL + 'user/country/store';

    try {
      GetStorage box = GetStorage();
      var api_token = await box.read('api_token');
      var response = await Api.execute(url: url, data: {
        'api_token': api_token,
        'country': country,
      });

      if (!response['error']) {
      } else {}
    } catch (e) {
      return 'Error: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, checkFirstSeen);
  }

  Future checkFirstSeen() async {
    GetStorage box = await GetStorage();
    String? api_token = await box.read('api_token');
    bool _seen = (box.read('seen') ?? false);
    if (_seen) {
      if (api_token == null) {
        Get.offAll(() => LoginScreen());
      } else {
        var country = await fetchCountryFromIP();
        await storeCountryToGetTimeZone(country);
        Get.offAll(() => Home_screen());
      }
    } else {
      await box.write('seen', true);
      Get.offAll(() => OnBoardingScreen());
    }
  }
}

initScreen(BuildContext context) {
  return Container(
    decoration: BoxDecoration(gradient: greenishgradient),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image(
                image: AssetImage("assets/images/splashLogo.png"),
                color: white,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
