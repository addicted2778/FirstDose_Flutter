class IntroModel {
  String? introimg;
  String? title;
  String? content;

  IntroModel({this.introimg, this.title, this.content});

  IntroModel.fromJson(Map<String, dynamic> json) {
    introimg = json['introimg'];
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['introimg'] = this.introimg;
    data['title'] = this.title;
    data['content'] = this.content;
    return data;
  }
}
