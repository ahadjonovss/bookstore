class CategoryModel{
  String categoryName;

  CategoryModel({required this.categoryName});

  factory CategoryModel.fromJson(Map<String,dynamic> json){
    return CategoryModel(categoryName: json["categoryName"]);
  }

  Map<String,dynamic> toJson(){
    return {
      "categoryName":categoryName
    };
  }
}