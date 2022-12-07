class CategoryModel {
  CategoryModel({
    required this.categoryId,
    required this.categoryName,
    required this.description,
    required this.imageUrl,
    required this.createdAt,
  });

  int categoryId;
  String categoryName;
  String description;
  String imageUrl;
  String createdAt;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    description: json["description"],
    imageUrl: json["image_url"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "description": description,
    "image_url": imageUrl,
    "created_at": createdAt,
  };
}
