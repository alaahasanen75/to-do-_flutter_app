class CardItem {
  int? id;
  String? img;
  String? name;

  var price;

  int? quantity;
  String? time;
  bool? isExit;

  CardItem(
      {this.id,
      this.img,
      this.name,
      this.isExit,
      this.price,
      this.quantity,
      this.time});

  CardItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    name = json['name'];
    isExit = json['isExit'];
    price = json['price'];
    quantity = json['quantity'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "img": this.img,
      "name": this.name,
      "isExit": this.isExit,
      "price": this.price,
      "quantity": this.quantity,
      "time": this.time
    };
  }
}
