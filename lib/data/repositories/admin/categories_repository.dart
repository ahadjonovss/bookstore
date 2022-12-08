import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopee/data/models/category_model.dart';

class CategoriesRepository{

  final FirebaseFirestore firebaseFirestore;
  CategoriesRepository({required this.firebaseFirestore});

  Future createCategory({required CategoryModel categoryModel})async{
    DocumentReference docId = await firebaseFirestore.collection("categories").add(categoryModel.toJson());
    await firebaseFirestore.collection("categories").doc(docId.id).update({
      "categoryId": docId.id,
  });}

  Future <CategoryModel> getCategoryByDocId(String docId) async {
    var data= await firebaseFirestore.collection("categories").doc(docId).get();

    return CategoryModel.fromJson(data.data() as Map<String,dynamic>);
  }


  Stream<List<CategoryModel>> getCategories() =>
      firebaseFirestore.collection("categories").snapshots().map(
            (event1) => event1.docs
            .map((doc) => CategoryModel.fromJson(doc.data()))
            .toList(),
      );

  Future<void> deleteCategory({required String docId}) async{
    try{
      await firebaseFirestore.collection("categories").doc(docId).delete();
    }on FirebaseException catch(e){
      print(e.toString());
    }
  }




}