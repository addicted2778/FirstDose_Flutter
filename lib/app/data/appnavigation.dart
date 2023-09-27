import 'package:firstdose/app/modules/authentication/login/views/login_view.dart';
import 'package:firstdose/app/modules/authentication/otpscreen/views/otpscreen_view.dart';
import 'package:firstdose/app/modules/mainscreen/home/views/home_view.dart';

import '../modules/authentication/otpscreen/controllers/otpscreen_controller.dart';
import 'package:get/get.dart';

abstract class Appnavigations {
  static void openOtpScreen(String phonenumber) {
    Get.delete<OtpscreenController>();
    Get.put(OtpscreenController(phonenumber: phonenumber));
    Get.to(() => OtpscreenView());
  }

  static void openLoginScreen() {
    Get.to(() => LoginView());
  }

  static void gotoLoginFromonBoarding() {
    Get.off(() => LoginView());
  }

  static void openHomeScreen() {
    Get.to(() => HomeView());
  }
}
