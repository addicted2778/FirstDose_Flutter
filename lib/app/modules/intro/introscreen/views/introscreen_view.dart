import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:firstdose/app/data/appcolors.dart';
import 'package:firstdose/app/data/appstrings.dart';
import 'package:firstdose/app/data/sharedwidgets/textwidget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../data/appnavigation.dart';
import '../controllers/introscreen_controller.dart';

class IntroscreenView extends GetView<IntroscreenController> {
  IntroscreenView({Key? key}) : super(key: key);

  final IntroscreenController _introscreenController =
      Get.put(IntroscreenController());
  @override
  Widget build(BuildContext context) {
    double screenhight = Get.height;
    double screenwidth = Get.width;
    return Scaffold(
      backgroundColor: Appcolors.themeColor,
      body: Stack(
        children: [
          Positioned(
            top: 100,
            right: 30,
            child: InkWell(
              onTap: () => {
                _introscreenController.appLocalData.saveIntroInfo(),
                Appnavigations.gotoLoginFromonBoarding()
              },
              child: ApptextWidget(
                  fontsize: 18,
                  textcolor: Appcolors.whitecolor,
                  textweightt: FontWeight.w600,
                  value: Appstring.skip),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: SizedBox(
              height: screenhight,
              width: screenwidth,
              child: onboradringImages(),
            ),
          ),
          Positioned(
              bottom: 30, right: 5, left: 5, child: _buildinstructioncardCard())
        ],
      ),
    );
  }

  onboradringImages() {
    return CarouselSlider(
      carouselController: _introscreenController.carouselController,
      options: CarouselOptions(
          reverse: false,
          enableInfiniteScroll: false,
          height: 400.0,
          viewportFraction: 1,
          onPageChanged: ((index, reason) =>
              _introscreenController.selectedindex(index))),
      items: _introscreenController.introdata.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: Get.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Image.asset(i.introimg ?? ''));
          },
        );
      }).toList(),
    );
  }

  Widget _buildinstructioncardCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        width: Get.width,
        height: 270,
        decoration: BoxDecoration(
            color: Appcolors.whitecolor,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            createDotIndicator(),
            const SizedBox(
              height: 15,
            ),
            Obx(
              () => ApptextWidget(
                  fontsize: 22,
                  textcolor: Appcolors.blackcolor,
                  textweightt: FontWeight.w700,
                  value: _introscreenController
                          .introdata[_introscreenController.currentIndex.value]
                          .title ??
                      ''),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => ApptextWidget(
                  fontsize: 14,
                  textcolor: Appcolors.greycolor,
                  textweightt: FontWeight.w700,
                  value: _introscreenController
                          .introdata[_introscreenController.currentIndex.value]
                          .content ??
                      ''),
            ),
            const Spacer(),
            _buildforwardButton(),
            const SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }

  createDotIndicator() {
    return Obx((() => DotsIndicator(
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(35.0, 10.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            activeColor: Appcolors.themeColor,
            color: Appcolors.lightintroScreenBgcolor,
          ),
          dotsCount: _introscreenController.introdata.length,
          position: double.parse(
              _introscreenController.currentIndex.value.toString()),
        )));
  }

  _buildforwardButton() {
    return InkWell(
      onTap: () => _introscreenController
          .proceedtonext(_introscreenController.currentIndex.value),
      child: Container(
        width: 53,
        height: 53,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Appcolors.blackcolor),
        child: Center(
            child: Image.asset(
          'assets/images/Path.png',
          height: 20,
        )),
      ),
    );
  }
}
