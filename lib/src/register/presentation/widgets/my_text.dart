
import 'package:flutter/material.dart';
import 'package:resize/resize.dart';

Widget myText({required String title,required double  size,FontWeight? bold,Color? color}  ){
  return  Text(
    title,
    style: TextStyle(fontSize: size.sp, fontWeight: bold,color: color),
  );
}