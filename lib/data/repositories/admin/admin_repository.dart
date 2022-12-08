import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopee/data/models/category_model.dart';

class AdminRepository{

  final FirebaseFirestore firebaseFirestore;
  AdminRepository({required this.firebaseFirestore});

  Future createCategory()async{
    final json={
      'categoryName':"Nmadir",
    };
    await firebaseFirestore.collection("categories").add(json);
  }

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



}