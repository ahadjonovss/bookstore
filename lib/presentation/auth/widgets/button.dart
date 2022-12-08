import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopee/components/widgets/text_widget.dart';
import 'package:shopee/view_models/auth_view_model.dart';

class AuthButton extends StatelessWidget {
  bool isLogin;
   AuthButton({required this.isLogin,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12),
      height: MediaQuery.of(context).size.height*0.05,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue
      ),
      child: Center(child: textWidget(isLogin?"Sign In":"Sign Up",color: Colors.white)),
    );
  }
}
