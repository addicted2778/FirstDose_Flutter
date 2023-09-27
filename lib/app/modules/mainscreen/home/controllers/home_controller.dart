import 'package:firstdose/app/data/appcolors.dart';
import 'package:firstdose/app/models/shopbycat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class HomeController extends GetxController {
  final drawerKey = GlobalKey<ScaffoldState>();
  List<ShopByCatModel> shjopbycat = [
    ShopByCatModel(
        catImg: 'assets/images/homepageicons/gd1.png', catTitle: 'Skin Care'),
    ShopByCatModel(
        catImg: 'assets/images/homepageicons/gd2.png', catTitle: 'Pain Relief'),
    ShopByCatModel(
        catImg: 'assets/images/homepageicons/gd3.png', catTitle: 'Vitamins'),
    ShopByCatModel(
        catImg: 'assets/images/homepageicons/gd4.png', catTitle: 'Skin Care'),
    ShopByCatModel(
        catImg: 'assets/images/homepageicons/gd5.png', catTitle: 'Pain Relief'),
    ShopByCatModel(
        catImg: 'assets/images/homepageicons/gd6.png', catTitle: 'Vitamins'),
  ];

  List itemilist = [
    AnimatedBarItems(
        icon: Image.asset('assets/images/homepageicons/home.png'),
        title: Text(
          'Home',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Appcolors.blackcolor),
        )),
    AnimatedBarItems(
        icon: Image.asset('assets/images/homepageicons/searchbottom.png'),
        title: Text(
          'search',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Appcolors.blackcolor),
        )),
    AnimatedBarItems(
        icon: Image.asset('assets/images/homepageicons/watchlist.png'),
        title: Text(
          'watchlist',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Appcolors.blackcolor),
        )),
    AnimatedBarItems(
        icon: Image.asset('assets/images/homepageicons/profile.png'),
        title: Text(
          'profile',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Appcolors.blackcolor),
        )),
  ];

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
}
