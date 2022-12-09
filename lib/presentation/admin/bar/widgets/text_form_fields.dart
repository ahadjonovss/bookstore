import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddBookInput extends StatelessWidget {
  int? maxLines=1;
  TextEditingController controller;
  String label;
  String hintText;
  dynamic validator;
  TextInputType? type=TextInputType.text;

   AddBookInput({required this.validator,required this.hintText,required this.label,required this.controller,this.maxLines,this.type,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        maxLines: maxLines,
        controller: controller,
        validator: validator,
        keyboardType: type,
        decoration:  InputDecoration(
          border:const OutlineInputBorder(),
          label: Text(label),
          hintText: hintText,
        ),
      ),
    );
  }
}
