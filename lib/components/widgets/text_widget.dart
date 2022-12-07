import 'dart:ui';

import 'package:flutter/material.dart';

Text textWidget(String text,{fontsize:16,FontWeight fontWeight=FontWeight.w600,Color color=Colors.blue}) {
  return  Text(
    text,
    style: TextStyle(color: color, fontSize: fontsize.toDouble(),fontWeight:fontWeight, ),
  );
}
