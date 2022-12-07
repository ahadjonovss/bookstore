class Product {
  Product({
    required this.productId,
    required this.categoryId,
    required this.shopId,
    required this.name,
    required this.images,
    required this.price,
    required this.count,
    required this.description,
    required this.createdAt,
    required this.currency,
  });

  int productId;
  int categoryId;
  int shopId;
  int name;
  List<dynamic> images;
  int price;
  int count;
  String description;
  String createdAt;
  String currency;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["product_id"],
    categoryId: json["category_id"],
    shopId: json["shop_id"],
    name: json["name"],
    images: List<dynamic>.from(json["images"].map((x) => x)),
    price: json["price"],
    count: json["count"],
    description: json["description"],
    createdAt: json["created_at"],
    currency: json["currency"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "category_id": categoryId,
    "shop_id": shopId,
    "name": name,
    "images": List<dynamic>.from(images.map((x) => x)),
    "price": price,
    "count": count,
    "description": description,
    "created_at": createdAt,
    "currency": currency,
  };
}
