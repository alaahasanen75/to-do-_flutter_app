class OrderModel {
  String? status;
  String? id;

  OrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    id = json['id'];
  }
}

List<Map<String, String>> data = [
  {
    'status': 'pending',
    'id': '1234',
  },
  {
    'status': 'pending',
    'id': '1234',
  },
  {
    'status': 'pending',
    'id': '1234',
  },
  {
    'status': 'history',
    'id': '1234',
  },
  {
    'status': 'history',
    'id': '1234',
  },
  {
    'status': 'history',
    'id': '1234',
  },
];

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
