import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/screens/app_translate/translate.dart';
import 'package:translation/screens/company_login/company_login_screen.dart';
import 'package:translation/screens/auth/login_screen.dart';
import 'package:translation/screens/main_screen/homecontroller.dart';
import 'package:translation/screens/setting/bug_report_modal.dart';
import 'package:translation/screens/setting/currency/currency_controller.dart';
import 'package:translation/screens/setting/settingcontroller.dart';
import 'package:translation/screens/setting/currency/currencyalert.dart';
import 'package:translation/static/language.dart';
import 'package:translation/static/settingcard.dart';
import 'package:translation/static/topbarr.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/screens/profile/profile.dart';
import 'package:translation/static/balancecard.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:translation/values/controllers.dart';

class Setting_screen extends StatefulWidget {
  const Setting_screen({super.key});

  @override
  State<Setting_screen> createState() => _Setting_screenState();
}

class _Setting_screenState extends State<Setting_screen> {
  final SettingController currencyController = Get.find();
  GetStorage box = GetStorage();
  final HomeController homeController = Get.find<HomeController>();
  var usercontroller = Get.put(SettingController.instance);
  String? selectedCurrency;
  void initState() {
    super.initState();
    selectedCurrency = box.read('selectedCurrency');
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      settingController.getbalance();
      // usercontroller.getcurrency();
      usercontroller.selectedCurrency;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: GetBuilder<HomeController>(
          builder: (controller) => GetBuilder<SettingController>(
                builder: (controller) => SingleChildScrollView(
                  child: Column(children: [
                    TitleTopbarr(
                      text: 'Settings'.tr,
                    ),
                    BalanceCard(
                      currency: controller.selectedCurrency,
                      balance: settingController.balance.toString(),
                      name: homeController.user!.username,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: SettingCard(
                        title: 'Profile'.tr,
                        onPressed: () {
                          profileController.clearField();
                          Get.to(() => Profile_screen());
                        },
                        imgicon: "assets/icons/profile.svg",
                      ),
                    ),
                    SettingCard(
                      title: 'language'.tr,
                      onPressed: () {
                        profileController.clearField();
                        Get.to(() => TranslateScreen());
                      },
                      imgicon: "assets/icons/msgss.svg",
                    ),

                    SettingCard(
                      title: 'Currency'.tr,
                      onPressed: () {
                        showDialog(
                            context: context, builder: (context) => Currency());
                      },
                      imgicon: "assets/icons/currency.svg",
                    ),
                    SettingCard(
                      title: 'Report bug/issues'.tr,
                      onPressed: () {
                        settingController.ClearbugVariables();
                        onBugTAp(context);
                      },
                      imgicon: "assets/icons/warning.svg",
                    ),

                    // SettingCard(
                    //   title: 'Company Access',
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => LoginCompanyScreen()),
                    //     );
                    //   },
                    //   imgicon: "assets/icons/home.svg",
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: SizedBox(
                        width: 140,
                        child: ElevatedButton(
                          onPressed: () {
                            logout(context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: greenish,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  "Log Out".tr,
                                  style: TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                      fontSize: 13),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SvgPicture.asset(
                                "assets/icons/out.svg",
                                color: white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
                ),
              )),
    ));
  }

  onBugTAp(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.zero, content: BugReportModal());
      },
    );
  }

  logout(context) {
    Alert(
      style: AlertStyle(
        titleStyle: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
      ),
      context: context,
      image: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: SvgPicture.asset(
            "assets/icons/out.svg",
            color: Colors.red,
            height: 30,
          )),
      title: "Are you sure you want to logout?".tr,
      buttons: [
        DialogButton(
          height: 38,
          width: 45,
          radius: BorderRadius.circular(20),
          child: Text(
            "No".tr,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600),
          ),
          onPressed: () {
            Get.back();
          },
          color: greenish,
        ),
        DialogButton(
          height: 38,
          width: 45,
          radius: BorderRadius.circular(20),
          border: Border.all(
            color: greenish.withOpacity(0.6),
          ),
          child: Text(
            "Yes".tr,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600),
          ),
          onPressed: () async {
            GetStorage box = GetStorage();
            Get.updateLocale(const Locale('en', 'US'));
            await box.write('locale', 'en');
            box.read('locale');
            box.remove('api_token');
            Get.offAll(() => LoginScreen());
          },
          color: greenish.withOpacity(0.6),
        ),
      ],
    ).show();
  }
}
