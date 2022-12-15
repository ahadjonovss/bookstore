
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/user_model.dart';

class UserRepository{
  final FirebaseFirestore firebaseFirestore;
  UserRepository({required this.firebaseFirestore});



  Future<void> signUp(UserModel user) async {
    DocumentReference docId =
        await firebaseFirestore.collection("users").add(user.toJson());
    await firebaseFirestore
        .collection("users")
        .doc(docId.id)
        .update({"userId": docId.id}).then((value) => true).onError((error, stackTrace) => false);
  }

  Stream<List<UserModel>> getAllUsers() {
    return firebaseFirestore.collection("users").snapshots().map(
            (event) => event.docs.map((e) => UserModel.fromJson(e.data())).toList());
  }

  Future<bool> signIn(String email,String password) async {
    var user= await firebaseFirestore.collection("users").where("email",isEqualTo: email);
    if(user==null){
      return false;
    }else{
      return true;
    }


  }


}
