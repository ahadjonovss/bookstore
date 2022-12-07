import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopee/data/repositories/auth_repository.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            children:   [
              const SizedBox(height: 200,),
              TextField(
                controller: email,
              ),
              TextField(
                controller: password,
              ),
              const SizedBox(height: 80,),
              IconButton(onPressed: () async {

                AuthRepository auth=AuthRepository(firebaseAuth: FirebaseAuth.instance);
                await auth.signUp(email: email.text, password: password.text);
              }, icon: Icon(Icons.app_registration))
            ],
          ),
        ),
      ),
    );
  }
}
