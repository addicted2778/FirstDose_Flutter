import 'package:firstdose/app/data/appstrings.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../../../data/appcolors.dart';
import '../../../../data/sharedwidgets/appbutton.dart';
import '../../../../data/sharedwidgets/textwidget.dart';
import '../controllers/otpscreen_controller.dart';

class OtpscreenView extends GetView<OtpscreenController> {
  OtpscreenView({Key? key}) : super(key: key);
  final OtpscreenController _otpscreenController =
      Get.find<OtpscreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Appcolors.whitecolor,
        body: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildforwardButton(),
                const SizedBox(
                  height: 40,
                ),
                Image.asset('assets/images/otp.png'),
                const SizedBox(
                  height: 30,
                ),
                _buildMiddletext(),
                const SizedBox(
                  height: 30,
                ),
                _buildOtpTextField(),
                const SizedBox(
                  height: 30,
                ),
                buildBottompart()
              ],
            ),
          ),
        ));
  }

  _buildforwardButton() {
    return InkWell(
      onTap: () => Get.back(),
      child: Container(
        width: 35,
        height: 35,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Appcolors.themeColor),
        child: Center(
            child: Image.asset(
          'assets/images/backwardarrow.png',
          height: 15,
        )),
      ),
    );
  }

  buildBottompart() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ApptextWidget(
                fontsize: 17,
                textcolor: Appcolors.lightgreycolor,
                textweightt: FontWeight.w400,
                value: Appstring.didnotrecivecode),
            ApptextWidget(
                fontsize: 20,
                textcolor: Appcolors.resendcodetextColor,
                textweightt: FontWeight.normal,
                value: Appstring.resendcode)
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Obx(() => InkWell(
              onTap: () => _otpscreenController.proccessing.value
                  ? null
                  : _otpscreenController.verifyOtp(),
              child: AppButton(
                  buttonborderraduios: 10,
                  buttoncolor: _otpscreenController.proccessing.value
                      ? Appcolors.lightthemencolor
                      : Appcolors.themeColor,
                  buttonfontcolor: _otpscreenController.proccessing.value
                      ? Appcolors.blackcolor
                      : Appcolors.whitecolor,
                  buttonfontsize: 17,
                  buttonfontwight: FontWeight.w600,
                  buttonheight: 55,
                  buttontext: _otpscreenController.proccessing.value
                      ? Appstring.pleasewait
                      : Appstring.verifyOtp,
                  elevation: 0,
                  buttonwidth: Get.width,
                  hasicon: false,
                  icon: ''),
            ))
      ],
    );
  }

  _buildOtpTextField() {
    return OTPTextField(
      contentPadding: const EdgeInsets.fromLTRB(0.0, 28.0, 0.0, 28.0),
      keyboardType: TextInputType.number,
      length: 6,
      otpFieldStyle: OtpFieldStyle(
          enabledBorderColor: Appcolors.extralightgreycolor,
          focusBorderColor: Appcolors.extralightgreycolor,
          borderColor: Appcolors.extralightgreycolor,
          backgroundColor: Appcolors.extralightgreycolor),
      width: Get.width,
      fieldWidth: 48,
      style: TextStyle(fontSize: 22, color: Appcolors.blackcolor),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.box,
      onCompleted: (pin) {
        _otpscreenController.otppin = pin;
      },
    );
  }

  _buildMiddletext() {
    return Column(
      children: [
        ApptextWidget(
            fontsize: 25,
            textcolor: Appcolors.blackcolor,
            textweightt: FontWeight.w700,
            value: Appstring.otpPageTitle),
        const SizedBox(
          height: 13,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ApptextWidget(
                fontsize: 17,
                textcolor: Appcolors.lightgreycolor,
                textweightt: FontWeight.w400,
                value: Appstring.otpPageSmallTitle),
            ApptextWidget(
                fontsize: 18,
                textcolor: Appcolors.bordercolor,
                textweightt: FontWeight.w400,
                value: '+91 ${_otpscreenController.phonenumber}'),
          ],
        ),
      ],
    );
  }
}
