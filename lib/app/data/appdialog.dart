import 'package:firstdose/app/data/appcolors.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class Appdialogs {
  static showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Appcolors.blackcolor,
        textColor: Appcolors.whitecolor,
        fontSize: 14);
  }
}
