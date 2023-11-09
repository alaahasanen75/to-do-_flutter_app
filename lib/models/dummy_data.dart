const List<Map<String, dynamic>> images = [
  {
    'id': 1,
    'image': 'assets/images/food1.jpg',
    "name": "The Shed BBQ & Blues Joint",
    "price": 35,
  },
  {
    'id': 2,
    'image': 'assets/images/food2.jpg',
    "name": "Perini Ranch Steakhouse",
    "price": 40,
  },
  {
    'id': 3,
    'image': 'assets/images/food3.jpg',
    "name": "Big Bob Gibson Bar-B-Q",
    "price": 80,
  },
  {
    'id': 4,
    'image': 'assets/images/food4.jpg',
    "name": "Guy Fieri",
    "price": 60,
  },
  {
    'id': 5,
    'image': 'assets/images/food5.jpg',
    "name": "Famous Dave's",
    "price": 48,
  }
];

class Data {
  String? id, img, name, dsc, country;
  double? price, rate;

  Data(
      {this.country,
      this.dsc,
      this.id,
      this.img,
      this.name,
      this.price,
      this.rate});

  Data.fromJson(Map<String, dynamic> json) {
    Data(
      country: json['country'],
      dsc: json['dsc'],
      id: json['id'],
      img: json['img'],
      name: json['name'],
      price: json['price'],
      rate: json['rate'],
    );
  }
}

class Popular {
  List<Bbqs>? bbqs;

  Popular({this.bbqs});

  Popular.fromJson(Map<String, dynamic> json) {
    if (json['bbqs'] != null) {
      bbqs = <Bbqs>[];
      json['bbqs'].forEach((v) {
        bbqs!.add(new Bbqs.fromJson(v));
      });
    }
  }
}

class Bbqs {
  String? id;
  String? img;
  String? name;
  String? dsc;
  var price;
  int? rate;
  String? country;

  Bbqs(
      {this.id,
      this.img,
      this.name,
      this.dsc,
      required this.price,
      this.rate,
      this.country});

  Bbqs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    name = json['name'];
    dsc = json['dsc'];
    price = json['price'];
    rate = json['rate'];
    country = json['country'];
  }
}
