import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/screens/bottom_nav_screen/bottom_nav.dart';
import 'package:translation/screens/login/authcontroller.dart';
import 'package:translation/screens/login/login_screen.dart';
import 'package:translation/screens/Otp/verifyphoneno.dart';
import 'package:translation/screens/main_screen/homecontroller.dart';
import 'package:translation/screens/profile/profile.dart';
import 'package:translation/screens/setting/settingcontroller.dart';
import 'package:translation/screens/splash_screen/splash_main.dart';
import 'package:translation/screens/translator_screens/notranslator.dart';
import 'package:translation/values/styles.dart';

void main() async {
  await LoadingHelper.init();
  Get.put(AuthController());
  Get.put(HomeController());
  Get.put(SettingController());
  await GetStorage.init();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: Styles.lightTheme,
      builder: EasyLoading.init(),
      title: "translation",
      initialRoute: 'splash',
      routes: {
        'splash': (_) => SplashScreen(),
        'login': (_) => LoginScreen(),
        'VerifyPhone': (_) => VerifyPhone(),
        'NoTranslator': (_) => NoTransFound_screen(),
      },
    );
  }
}
