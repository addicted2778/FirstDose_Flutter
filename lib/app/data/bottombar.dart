import 'package:firstdose/app/data/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class AppBottomBar extends StatefulWidget {
  int selected = 2;
  List bottombarItems = [];
  AppBottomBar(
      {super.key, required this.bottombarItems, required this.selected});

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  @override
  Widget build(BuildContext context) {
    return StylishBottomBar(
      backgroundColor: Appcolors.lightintroScreenBgcolor,
      currentIndex: widget.selected,
      fabLocation: StylishBarFabLocation.center,
      items: widget.bottombarItems,
      iconSize: 27,

      hasNotch: true,
      // opacity: 0.3,
      // onTap: (index) {
      //   globalcontrollerController.selected.value = index ?? 2;
      //   sharedFunctions.navigateToBottomPages(index ?? 2);
      //   // _homepageController.selected.value = 2;
      // },
    );
  }
}
