class Product {
  final String id;
  final String name;
  final double price;
  final String picture;
  final int payCount;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.picture,
    required this.payCount,
  });

  factory Product.fromJSON(Map<String, dynamic> data) {
    return Product(
      id: data["id"] as String,
      name: data["name"] as String,
      price: (data["price"] as num).toDouble(),
      picture: data["picture"] as String,
      payCount: data["payCount"] as int,
    );
  }
}
