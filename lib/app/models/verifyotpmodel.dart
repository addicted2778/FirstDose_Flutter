class VerifyOtpModel {
  int? status;
  Data? data;

  VerifyOtpModel({this.status, this.data});

  VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? bearerToken;
  String? name;
  String? email;
  String? phoneNumber;
  String? profileImage;

  Data(
      {this.bearerToken,
      this.name,
      this.email,
      this.phoneNumber,
      this.profileImage});

  Data.fromJson(Map<String, dynamic> json) {
    bearerToken = json['bearer_token'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bearer_token'] = this.bearerToken;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['profile_image'] = this.profileImage;
    return data;
  }
}
