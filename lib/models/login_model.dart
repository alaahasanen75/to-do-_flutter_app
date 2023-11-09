class LoginModel {
  bool? status;
  String? masage;
  UserData? Data;

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    masage = json['message'];

    Data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  String? name;
  String? email;
  String? phone;
  String? image;
  String? token;
  int? points;
  int? credit;
  int? id;

  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json[' phone'];
    image = json['image'];
    token = json['token'] ?? 'token';
    points = json['points'];
    credit = json['credit'];
    id = json['id'];
  }
}
