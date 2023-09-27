import 'package:firstdose/app/data/appcolors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  double buttonheight;
  double buttonwidth;
  Color buttoncolor;
  String buttontext;
  double buttonborderraduios;
  FontWeight buttonfontwight;
  double buttonfontsize;
  Color buttonfontcolor;
  double elevation;
  bool hasicon;
  String icon;
  AppButton(
      {super.key,
      required this.buttonborderraduios,
      required this.buttoncolor,
      required this.buttonfontcolor,
      required this.buttonfontsize,
      required this.buttonfontwight,
      required this.buttonheight,
      required this.buttontext,
      required this.elevation,
      required this.buttonwidth,
      required this.hasicon,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(buttonborderraduios),
      child: Container(
        height: buttonheight,
        width: buttonwidth,
        decoration: BoxDecoration(
            color: buttoncolor,
            borderRadius: BorderRadius.circular(buttonborderraduios)),
        child: hasicon
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(' ',
                        style: TextStyle(
                            fontWeight: buttonfontwight,
                            color: Appcolors.blackcolor,
                            fontSize: buttonfontsize)),
                    Text(buttontext,
                        style: TextStyle(
                            fontWeight: buttonfontwight,
                            color: buttonfontcolor,
                            fontSize: buttonfontsize)),
                    // Lottie.asset(icon, height: 19),
                  ],
                ),
              )
            : Center(
                child: Text(buttontext,
                    style: TextStyle(
                        fontWeight: buttonfontwight,
                        color: buttonfontcolor,
                        fontSize: buttonfontsize)),
              ),
      ),
    );
  }
}
