import 'package:firstdose/app/data/localdata.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();

  String intialRoute = Routes.LOGIN;
  final appLocalData = AppLocalData();
  bool appinstalled = appLocalData.getIntroInfo();
  bool logedin = appLocalData.getloginSuccess();

  if (appinstalled) {
    if (logedin) {
      intialRoute = Routes.HOME;
    } else {
      intialRoute = Routes.LOGIN;
    }
  } else {
    intialRoute = Routes.INTROSCREEN;
  }

  runApp(
    GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: intialRoute,
      getPages: AppPages.routes,
    ),
  );
}
