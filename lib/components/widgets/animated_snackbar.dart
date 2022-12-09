import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Future<void> MySnackBar(context,{required String notification,required Color color,required Icon icon,Color texColor=Colors.white}){
  return AnimatedSnackBar(
      builder: ((context) {
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children:  [
              icon,
              const SizedBox(
                width: 20,
              ),
              Text(
                notification,
                style:  TextStyle(color: texColor),
              )
            ],
          ),
        );
      }),
      duration: const Duration(seconds: 5),
      snackBarStrategy: const ColumnSnackBarStrategy())
      .show(context);
}