class LoginResponseModel {
  int? status;
  String? message;
  Data? data;

  LoginResponseModel({this.status, this.message, this.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? otpScreen;

  Data({this.otpScreen});

  Data.fromJson(Map<String, dynamic> json) {
    otpScreen = json['otp_screen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp_screen'] = this.otpScreen;
    return data;
  }
}