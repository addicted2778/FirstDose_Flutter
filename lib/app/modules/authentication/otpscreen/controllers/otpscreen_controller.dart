import 'dart:convert';

import 'package:firstdose/app/data/appnavigation.dart';
import 'package:firstdose/app/data/appstrings.dart';
import 'package:firstdose/app/data/localdata.dart';
import 'package:firstdose/app/models/otpverifyfailmodel.dart';
import 'package:firstdose/app/models/verifyotpmodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../data/apis.dart';
import '../../../../data/appdialog.dart';

class OtpscreenController extends GetxController {
  String phonenumber = '0101010101';
  final appLocalData = AppLocalData();
  String otppin = '';
  RxBool proccessing = false.obs;
  OtpscreenController({required this.phonenumber});
  VerifyOtpModel _verifyOtpModel = VerifyOtpModel();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  verifyOtp() async {
    try {
      proccessing.value = true;
      Map bodydata = {"otp": otppin, "phone_number": phonenumber};
      var url = Uri.parse(Apis.otpApiUrl);
      final response = await http.post(url, body: bodydata);

      if (response.statusCode == 200) {
        var parsedData = jsonDecode(response.body);
       

        _verifyOtpModel = VerifyOtpModel.fromJson(parsedData);
        proccessing.value = false;
        if (_verifyOtpModel.status == 1) {
          appLocalData.saveloginSuccess();
          Appdialogs.showToast(Appstring.verifyOtp);
          Appnavigations.openHomeScreen();
          proccessing.value = false;
        } else if (_verifyOtpModel.status == 0) {
          OtpFailModel ofm = OtpFailModel.fromJson(parsedData);
          Appdialogs.showToast(ofm.message ?? '');
          proccessing.value = false;
        } else {
          Appdialogs.showToast(Appstring.somethingwentwrong);
          proccessing.value = false;
        }
      }
    } catch (e) {
      proccessing.value = false;
      throw Exception(e);
    }
  }
}
