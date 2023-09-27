abstract class FormValidation {
  static validateMobile(String value) {
    final patttern = RegExp(r'(^[6-9][0-9]*$)');
    if (value == '') {
      return 'Please enter Mobile Number';
    } else if (value.length != 10) {
      'Mobile number must 10 digits';
    } else if (!patttern.hasMatch(value)) {
      return 'Please enter valid Mobile Number';
    }
  }
}
