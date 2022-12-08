class CategoryModel{
  String categoryName;
  String? docId;

  CategoryModel({required this.categoryName,required this.docId});

  factory CategoryModel.fromJson(Map<String,dynamic> json){
    return CategoryModel(
        categoryName: json["categoryName"]??"no data",
      docId: json["docId"]??"no Id"
    );
  }

  Map<String,dynamic> toJson(){
    return {
      "categoryName":categoryName,
      "categoryId":docId
    };
  }
}