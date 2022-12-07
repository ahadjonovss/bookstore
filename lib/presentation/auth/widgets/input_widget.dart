import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  dynamic validator;

  InputWidget({required this.hintText,required this.validator,required this.controller,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12),
      height: MediaQuery.of(context).size.height*0.05,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey,width: 2)
      ),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration:  InputDecoration(
            hintText: hintText,
            border: InputBorder.none
        ),
        validator: validator,
      ),
    );
  }
}
