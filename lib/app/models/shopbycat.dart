class ShopByCatModel {
  String? catImg;
  String? catTitle;

  ShopByCatModel({this.catImg, this.catTitle});

  ShopByCatModel.fromJson(Map<String, dynamic> json) {
    catImg = json['catImg'];
    catTitle = json['catTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['catImg'] = this.catImg;
    data['catTitle'] = this.catTitle;
    return data;
  }
}
