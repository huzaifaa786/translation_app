import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/screens/freeitem.dart/free_items.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/screens/company_login/company_controller.dart';
import 'package:translation/screens/favorites_screen/favorites_controller.dart';
import 'package:translation/screens/forgot.dart/emailOtp.dart';
import 'package:translation/screens/checkout/checkout_controller.dart';
import 'package:translation/screens/enter_amount/amountcontroller.dart';
import 'package:translation/screens/auth/authcontroller.dart';
import 'package:translation/screens/auth/login_screen.dart';
import 'package:translation/screens/main_screen/homecontroller.dart';
import 'package:translation/screens/notification/notificationcontroller.dart';
import 'package:translation/screens/orderhistory/ordercontroller.dart';
import 'package:translation/screens/profile/profilecontroller.dart';
import 'package:translation/screens/chat/chatcontroller.dart';
import 'package:translation/screens/setting/currency/currency_controller.dart';
import 'package:translation/screens/setting/currency/currencyalert.dart';
import 'package:translation/screens/setting/settingcontroller.dart';
import 'package:translation/screens/splash_screen/splash_main.dart';
import 'package:translation/screens/splash_screen/splash_screen1.dart';
import 'package:translation/screens/translator_screens/notranslator.dart';
import 'package:translation/services/auth_services/mobileotp_services.dart';
import 'package:translation/translation.dart';
import 'package:translation/values/styles.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:translation/screens/translator/translator_profile_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //  ScreenUtil.init( );
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
  Get.put(OTPServices());
  Get.put(FavController());
  Get.put(ChatController());
  Get.put(CompanyController());
  // Get.put(CurrencyController());

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
  GetStorage box = GetStorage();
  String? localeStr;
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      localeStr = await box.read('locale');
      print(localeStr);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocaleString(),
      locale: box.read('locale') != 'ar'
          ? Locale('en', 'US')
          : Locale('ar', 'AE'),
      fallbackLocale: box.read('locale') != 'ar'
          ? Locale('en', 'US')
          : Locale('ar', 'AE'),
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: Styles.lightTheme,
      builder: EasyLoading.init(),
      title: "translation",
      initialRoute: 'splash',
      routes: {
        'freeItems': (_) => FreeItems(),
        'splash': (_) => SplashScreen(),
        'login': (_) => LoginScreen(),
        'onBoardingScreen': (_) => OnBoardingScreen(),
        'NoTranslator': (_) => NoTransFound_screen(),
        'Verify': (_) => EmailOtpVerifyScreen(),
        // 'currency': (_) => Currency()
      },
    );
  }
}
