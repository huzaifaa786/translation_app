import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:translation/screens/enter_amount/enteramount.dart';
import 'package:translation/screens/company_login/company_login_screen.dart';
import 'package:translation/screens/setting/bug_report_modal.dart';
import 'package:translation/static/language.dart';
import 'package:translation/static/settingcard.dart';
import 'package:translation/values/colors.dart';
import 'package:translation/screens/main_screen/home.dart';
import 'package:translation/screens/profile/profile.dart';
import 'package:translation/static/titletopbar.dart';
import 'package:translation/static/balancecard.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Setting_screen extends StatefulWidget {
  const Setting_screen({super.key});

  @override
  State<Setting_screen> createState() => _Setting_screenState();
}

class _Setting_screenState extends State<Setting_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            TitleTopbar(
              text: 'Setting',
              ontap: () {
                Navigator.pop(context);
              },
            ),
            BalanceCard(
              balance: '134.34',
              name: 'willam jones',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SettingCard(
                title: 'Profile',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile_screen()),
                  );
                },
                imgicon: "assets/icons/profile.svg",
              ),
            ),
            LanguageCard(
              title: 'Language',
              onPressed: () {},
              imgicon: "assets/icons/msgss.svg",
            ),
            SettingCard(
              title: 'Report bug/issues',
              onPressed: () {
                onBugTAp(context);
              },
              imgicon: "assets/icons/warning.svg",
            ),
            SettingCard(
              title: 'Vendor Access',
              onPressed: () {},
              imgicon: "assets/icons/unprofile.svg",
            ),
            SettingCard(
              title: 'Company Access',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginCompanyScreen()),
                );
              },
              imgicon: "assets/icons/home.svg",
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: InkWell(
                onTap: () {
                  logout(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Log Out",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Lato',
                            fontSize: 17),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SvgPicture.asset(
                          "assets/icons/arrow.svg", // replace with your logo asset path
                          height: 12,
                          width: 12,
                        ),
                      ),
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
      ),
    );
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
        child: SvgPicture.asset('assets/images/logout.svg'),
      ),
      title: "Are you sure you want to logout?",
      buttons: [
        DialogButton(
          height: 55,
          radius: BorderRadius.circular(13),
          child: Text(
            "Yes",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600),
          ),
          onPressed: () => Navigator.pop(context),
          color: greenish,
        ),
        DialogButton(
          height: 55,
          radius: BorderRadius.circular(13),
          border: Border.all(
            color: Colors.black54,
          ),
          child: Text(
            "No",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.black,
        ),
      ],
    ).show();
  }
}
