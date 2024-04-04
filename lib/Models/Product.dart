class ProductModels {
  String? id;
  String? name;
  String? description;
  double? price;
  String? image;
  dynamic size;
  int? quantity;

  ProductModels(
      {required this.id,
      required this.name,
      required this.description,
      required this.image,
      required this.price,
      required this.quantity,
      required this.size});

  ProductModels.fromMap(Map<String, dynamic> map) {
    id = map["productId"];
    name = map["name"];
    description = map["description"];
    image = map["image"];
    price = map["price"];
    size = size["size"];
    quantity = map["quatity"];
  }
  Map<String, dynamic> tomap() {
    return {
      "productId": id,
      "name": name,
      "description": description,
      "image": image,
      "price": price,
      "quantity": quantity,
      "size": size,
    };
  }
}
