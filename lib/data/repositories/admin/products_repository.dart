import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:shopee/data/models/book_model.dart';

class ProductsRepository {
  final FirebaseFirestore firebaseFirestore;
  ProductsRepository({required this.firebaseFirestore});

  Future addProduct({required Book book}) async {
    DocumentReference docId =
        await firebaseFirestore.collection("products").add(book.toJson());
    await firebaseFirestore
        .collection("products")
        .doc(docId.id)
        .update({"productId": docId.id});
  }

  Future<Book> getProductByDocId(String docId) async {
    var data = await firebaseFirestore.collection("products").doc(docId).get();
    return Book.fromJson(data.data() as Map<String, dynamic>);
  }

  Stream<List<Book>> getCategories() {
    return firebaseFirestore.collection("products").snapshots().map(
        (event) => event.docs.map((e) => Book.fromJson(e.data())).toList());
  }

  Future<void> deleteProductByDocId({required String docId}) async {
    try{
      await firebaseFirestore.collection("products").doc(docId).delete();
    }on FirebaseException catch(e){
      if (kDebugMode) {
        print("Error bo'ldi : ${e.toString()}");
      }
    }
  }

  Future<void> updateCategory({required Book book,required String docId}) async {
    try{
      // ignore: avoid_print
      await firebaseFirestore.collection("categories").doc(docId).update(book.toJson()).then((value) => print("Updated to ${book.name}"));
    }on FirebaseException catch(e){
      if (kDebugMode) {
        print("Error: ${e.toString()}");
      }

    }
  }

}
