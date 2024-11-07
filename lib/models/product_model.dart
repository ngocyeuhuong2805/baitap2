class ProductModel {
  final dynamic id;
  final String name;
  final String price;
  final String imgUrl;
  final String quantity;
  String quantityToCard;

  ProductModel(
      {this.id, required this.name,
      required this.price,
      required this.imgUrl,
      required this.quantity,
      required this.quantityToCard,
      });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imgUrl': imgUrl,
      'name': name,
      'price': price,
      'quantity': quantity,
      'quantityToCard': quantityToCard,
    };
  }

  // Tạo ProductModel từ JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      imgUrl: json['imgUrl'],
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'],
      quantityToCard: json['quantityToCard'],
    );
  }
  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ price.hashCode ^ imgUrl.hashCode ^ quantity.hashCode ^ quantityToCard.hashCode;
  }
  int getPriceProductCart() {
    return int.parse(price) * int.parse(quantityToCard);

  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.id == id &&
        other.name == name &&
        other.price == price &&
        other.imgUrl == imgUrl &&
        other.quantity == quantity &&
        other.quantityToCard == quantityToCard;
  }
}
