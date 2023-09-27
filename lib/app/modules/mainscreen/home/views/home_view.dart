import 'package:firstdose/app/data/appcolors.dart';
import 'package:firstdose/app/data/appstrings.dart';
import 'package:firstdose/app/data/bottombar.dart';
import 'package:firstdose/app/data/sharedwidgets/textwidget.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';

import '../../../../data/sharedwidgets/appbutton.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final HomeController _homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homeController.drawerKey,
      drawer: const Drawer(),
      floatingActionButton: _buildVBottomUploadButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:
          AppBottomBar(bottombarItems: _homeController.itemilist, selected: 2),
      backgroundColor: Appcolors.scaffoldbgcolor,
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildAppBar(),
              const SizedBox(
                height: 35,
              ),
              _buildSearchBar(),
              const SizedBox(
                height: 30,
              ),
              _buildContainer(),
              const SizedBox(
                height: 20,
              ),
              _buildGrid()
            ],
          ),
        ),
      ),
    );
  }

  _buildVBottomUploadButton() {
    return Container(
      width: 60,
      height: 60,
      decoration:
          BoxDecoration(color: Appcolors.themeColor, shape: BoxShape.circle),
      child:
          Center(child: Image.asset('assets/images/homepageicons/camera.png')),
    );
  }

  _buildGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ApptextWidget(
                fontsize: 25,
                textcolor: Appcolors.blackcolor,
                textweightt: FontWeight.w700,
                value: Appstring.shopbycat),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: Get.width,
          height: Get.height * 0.36,
          decoration: BoxDecoration(
            color: Appcolors.whitecolor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildShopByCatImg(
                        _homeController.shjopbycat[0].catImg ?? '',
                        _homeController.shjopbycat[0].catTitle ?? ''),
                    _buildShopByCatImg(
                        _homeController.shjopbycat[1].catImg ?? '',
                        _homeController.shjopbycat[1].catTitle ?? ''),
                    _buildShopByCatImg(
                        _homeController.shjopbycat[2].catImg ?? '',
                        _homeController.shjopbycat[2].catTitle ?? '')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildShopByCatImg(
                        _homeController.shjopbycat[3].catImg ?? '',
                        _homeController.shjopbycat[3].catTitle ?? ''),
                    _buildShopByCatImg(
                        _homeController.shjopbycat[4].catImg ?? '',
                        _homeController.shjopbycat[4].catTitle ?? ''),
                    _buildShopByCatImg(
                        _homeController.shjopbycat[5].catImg ?? '',
                        _homeController.shjopbycat[5].catTitle ?? '')
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  _buildShopByCatImg(String img, String title) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            img,
            height: 75,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ApptextWidget(
            fontsize: 16,
            textcolor: Appcolors.blackcolor,
            textweightt: FontWeight.w700,
            value: title),
      ],
    );
  }

  _buildContainer() {
    return Container(
      height: Get.height * 0.23,
      width: Get.width,
      decoration: BoxDecoration(
        color: Appcolors.lightthemencolor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ApptextWidget(
                    fontsize: 20,
                    textcolor: Appcolors.blackcolor,
                    textweightt: FontWeight.w700,
                    value: Appstring.deliverymessage),
                const SizedBox(
                  height: 20,
                ),
                AppButton(
                    buttonborderraduios: 10,
                    buttoncolor: Appcolors.themeColor,
                    buttonfontcolor: Appcolors.whitecolor,
                    buttonfontsize: 16,
                    buttonfontwight: FontWeight.w400,
                    buttonheight: 30,
                    buttontext: Appstring.ordernnow,
                    elevation: 0,
                    buttonwidth: 100,
                    hasicon: false,
                    icon: ''),
              ],
            ),
            Image.asset('assets/images/homepageicons/man.png')
          ],
        ),
      ),
    );
  }

  _buildSearchBar() {
    return Container(
      height: 55,
      width: Get.width,
      decoration: BoxDecoration(
          color: Appcolors.whitecolor,
          borderRadius: BorderRadius.circular(20),
          border:
              Border.all(width: 1.5, color: Appcolors.searchbarbordercolor)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ApptextWidget(
                  fontsize: 17,
                  textcolor: Appcolors.searchvartextcolor,
                  textweightt: FontWeight.w500,
                  value: Appstring.searchbartext),
              Image.asset('assets/images/homepageicons/search.png'),
            ],
          ),
        ),
      ),
    );
  }

  _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => _homeController.drawerKey.currentState!.openDrawer(),
          child: Image.asset('assets/images/homepageicons/menu.png'),
        ),
        Image.asset('assets/images/homepageicons/applogo.png'),
        badges.Badge(
          badgeColor: Appcolors.themeColor,
          badgeContent: ApptextWidget(
              fontsize: 14,
              textcolor: Appcolors.whitecolor,
              textweightt: FontWeight.normal,
              value: '1'),
          child: Image.asset('assets/images/homepageicons/bag.png'),
        ),
      ],
    );
  }
}
