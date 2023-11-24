import 'package:translation/screens/checkout/checkout_controller.dart';
import 'package:translation/screens/company_login/company_controller.dart';
import 'package:translation/screens/enter_amount/amountcontroller.dart';
import 'package:translation/screens/auth/authcontroller.dart';
import 'package:translation/screens/favorites_screen/favorites_controller.dart';
import 'package:translation/screens/main_screen/homecontroller.dart';
import 'package:translation/screens/notification/notificationcontroller.dart';
import 'package:translation/screens/orderhistory/ordercontroller.dart';
import 'package:translation/screens/profile/profilecontroller.dart';
import 'package:translation/screens/setting/settingcontroller.dart';
import 'package:translation/screens/translator/translator_profile_controller.dart';
import 'package:translation/services/auth_services/mobileotp_services.dart';
import 'package:translation/screens/chat/chatcontroller.dart';

AuthController authController = AuthController.instance;
HomeController homeController = HomeController.instance;
SettingController settingController = SettingController.instance;
AmountController amountController = AmountController.instance;
ProfileController profileController = ProfileController.instance;
OrderController orderController = OrderController.instance;
NotificationController notificationController = NotificationController.instance;
TranslatorProfileController translatorProfileController =
TranslatorProfileController.instance;
CheckOutController checkoutController = CheckOutController.instance;
OTPServices otpServices = OTPServices.instance;
ChatController chatController = ChatController.instance;
FavController favController = FavController.instance;
CompanyController companyController = CompanyController.instance;
