import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopee/components/widgets/text_widget.dart';
import 'package:shopee/view_models/auth_view_model.dart';

class AuthButton extends StatelessWidget {
  String email;
  String password;
  bool isLogin;
  GlobalKey<FormState> formKey;
   AuthButton({required this.formKey,required this.password,required this.email,required this.isLogin,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        formKey.currentState!.validate();
        isLogin?context.read<AuthViewModel>().signUp(email: email, password: password):context.read<AuthViewModel>().signUp(email: email, password: password);

      },
      child: Container(
        padding: const EdgeInsets.only(left: 12),
        height: MediaQuery.of(context).size.height*0.05,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue
        ),
        child: Center(child: textWidget(isLogin?"Sign In":"Sign Up",color: Colors.white)),
      ),
    );
  }
}
