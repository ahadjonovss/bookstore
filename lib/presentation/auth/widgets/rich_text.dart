import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthRichText extends StatelessWidget {
  String RouteName;
  String firsttxt;
  String secondtxt;
  AuthRichText({required this.RouteName,required this.firsttxt,required this.secondtxt,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  RichText(
        text: TextSpan(
            text: firsttxt+' ',
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),
                recognizer: TapGestureRecognizer()
                  ..onTap = (){
                  Navigator.pushNamed(context, RouteName);
                  },
                text: secondtxt,
              )
            ]));
  }
}
