import 'dart:convert';

import 'package:firstdose/app/data/apis.dart';
import 'package:firstdose/app/data/appdialog.dart';
import 'package:firstdose/app/data/appnavigation.dart';
import 'package:firstdose/app/data/appstrings.dart';
import 'package:firstdose/app/models/loginfailmodel.dart';
import 'package:firstdose/app/models/loginresponcemodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class LoginController extends GetxController {
  final phone = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool proccessing = false.obs;
  LoginResponseModel _loginResponseModel = LoginResponseModel();

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
    phone.dispose();
  }

  loginUser() async {
    if (formKey.currentState!.validate()) {
      try {
        proccessing.value = true;
        Map bodydata = {"phone_number": phone.text};
        var url = Uri.parse(Apis.loginApiUrl);
        var response = await http.post(url, body: bodydata);

        if (response.statusCode == 200) {
          var parsedData = jsonDecode(response.body);

          _loginResponseModel = LoginResponseModel.fromJson(parsedData);

          if (_loginResponseModel.status == 1) {
            Appdialogs.showToast(_loginResponseModel.message ?? '');
          print(url);
            print("param=" +
                bodydata.toString() +
                "\n" +
                "response=" +
                response.body +
                "\n" +
                "statusCode=" +
                response.statusCode.toString());
            Appnavigations.openOtpScreen(phone.text);
            proccessing.value = false;
          } else if (_loginResponseModel.status == 0) {
            LoginFailModel lfm = LoginFailModel.fromJson(parsedData);
            Appdialogs.showToast(lfm.message ?? '');
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
}
