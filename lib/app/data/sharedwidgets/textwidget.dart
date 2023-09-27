import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ApptextWidget extends StatelessWidget {
  String value;
  FontWeight textweightt;
  double fontsize;
  Color textcolor;
  ApptextWidget(
      {super.key,
      required this.fontsize,
      required this.textcolor,
      required this.textweightt,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return buildTextWidget(value, textweightt, fontsize, textcolor);
  }

  buildTextWidget(
      String value, FontWeight textweightt, double fontsize, Color textcolor) {
    return Text(
      value,
      style: TextStyle(
          fontWeight: textweightt, fontSize: fontsize, color: textcolor),
    );
  }
}
