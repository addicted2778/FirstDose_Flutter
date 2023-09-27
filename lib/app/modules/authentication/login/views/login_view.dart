import 'package:firstdose/app/data/appstrings.dart';
import 'package:firstdose/app/data/formvalidation.dart';
import 'package:firstdose/app/data/sharedwidgets/appbutton.dart';
import 'package:firstdose/app/data/sharedwidgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../../data/appcolors.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  final LoginController _loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    double screenhight = Get.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenhight * 0.15,
              ),
              Image.asset('assets/images/login.png'),
              const SizedBox(
                height: 30,
              ),
              _buildMiddletext(),
              const SizedBox(
                height: 30,
              ),
              _buildLoginForm()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _loginController.formKey,
      child: Column(
        children: [
          TextFormField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(10),
            ],
            validator: ((value) => FormValidation.validateMobile(value ?? '')),
            cursorColor: Appcolors.greycolor,
            keyboardType: TextInputType.phone,
            controller: _loginController.phone,
            decoration: InputDecoration(
              suffixStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Appcolors.blackcolor,
                  fontSize: 10),
              contentPadding: const EdgeInsets.fromLTRB(15.0, 17.0, 10.0, 17.0),
              label: ApptextWidget(
                  fontsize: 12,
                  textcolor: Appcolors.themeColor,
                  textweightt: FontWeight.normal,
                  value: Appstring.enterpohinenumber),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
                borderSide:
                    BorderSide(color: Appcolors.bordercolor, width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
                borderSide:
                    BorderSide(color: Appcolors.bordercolor, width: 0.5),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Obx(
            () => InkWell(
              onTap: () => _loginController.proccessing.value
                  ? null
                  : _loginController.loginUser(),
              child: AppButton(
                  buttonborderraduios: 10,
                  buttoncolor: _loginController.proccessing.value
                      ? Appcolors.lightthemencolor
                      : Appcolors.themeColor,
                  buttonfontcolor: _loginController.proccessing.value
                      ? Appcolors.blackcolor
                      : Appcolors.whitecolor,
                  buttonfontsize: 17,
                  buttonfontwight: FontWeight.w600,
                  buttonheight: 55,
                  buttontext: _loginController.proccessing.value
                      ? Appstring.pleasewait
                      : Appstring.continuetext,
                  elevation: 0,
                  buttonwidth: Get.width,
                  hasicon: false,
                  icon: ''),
            ),
          ),
        ],
      ),
    );
  }

  _buildMiddletext() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ApptextWidget(
            fontsize: 25,
            textcolor: Appcolors.blackcolor,
            textweightt: FontWeight.w700,
            value: Appstring.loginPageTitle),
        const SizedBox(
          height: 13,
        ),
        ApptextWidget(
            fontsize: 14,
            textcolor: Appcolors.greycolor,
            textweightt: FontWeight.w400,
            value: Appstring.loginPageSmallTitle),
      ],
    );
  }
}
