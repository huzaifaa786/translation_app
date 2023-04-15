import 'package:flutter/material.dart';
import 'package:translation/screens/bottom_nav_screen/bottom_nav.dart';
import 'package:translation/screens/login/login_screen.dart';
import 'package:translation/screens/Otp/verifyphoneno.dart';
import 'package:translation/screens/profile/profile.dart';
import 'package:translation/screens/splash_screen/splash_main.dart';
import 'package:translation/screens/translator_screens/notranslator.dart';
import 'package:translation/values/styles.dart';

void main() async {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: Styles.lightTheme,
      title: "translation",
      initialRoute: 'login',
      routes: {
        'splash': (_) => SplashScreen(),
        'login': (_) => LoginScreen(),
        'VerifyPhone': (_) => VerifyPhone(),
        'NoTranslator': (_) => NoTransFound_screen(),
      },
    );
  }
}
