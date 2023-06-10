import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/screens/translator/map.dart';
import 'package:translation/screens/checkout/checkout_controller.dart';
import 'package:translation/screens/enter_amount/amountcontroller.dart';
import 'package:translation/screens/login/authcontroller.dart';
import 'package:translation/screens/login/login_screen.dart';
import 'package:translation/screens/Otp/verifyphoneno.dart';
import 'package:translation/screens/main_screen/homecontroller.dart';
import 'package:translation/screens/notification/notificationcontroller.dart';
import 'package:translation/screens/orderhistory/ordercontroller.dart';
import 'package:translation/screens/profile/profilecontroller.dart';
import 'package:translation/screens/setting/settingcontroller.dart';
import 'package:translation/screens/splash_screen/splash_main.dart';
import 'package:translation/screens/translator_screens/notranslator.dart';
import 'package:translation/values/styles.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:translation/screens/translator/translator_profile_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LoadingHelper.init();
  Get.put(AuthController());
  Get.put(HomeController());
  Get.put(ProfileController());
  Get.put(SettingController());
  Get.put(AmountController());
  Get.put(ProfileController());
  Get.put(NotificationController());
  Get.put(OrderController());
  Get.put(TranslatorProfileController());
  Get.put(CheckOutController());
  await GetStorage.init();
  Stripe.publishableKey =
      'pk_test_51MlTmPAN8zi2vyFswyWqxxJKbe8NnGRtoOo55Z2P65V8EykUYWk034zKSkXkh2THsQZ6OYZzdoQOUxXmSmPiPz9G00dQnMo69A';
  Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  Stripe.urlScheme = 'flutterstripe';
  await Stripe.instance.applySettings();
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
        'map': (_) => DeliveryMap(),
        'splash': (_) => SplashScreen(),
        'login': (_) => LoginScreen(),
        'VerifyPhone': (_) => VerifyPhone(),
        'NoTranslator': (_) => NoTransFound_screen(),
      },
    );
  }
}
