

import 'package:flutter/material.dart';
import 'package:resize/resize.dart';

import 'myText.dart';

Widget cardAccount(String title, String subTitle,String urlImage,{Color? color}){
  return   Container(
    width: 22.vw,
    height: 20.vh,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(width: 1, color: Colors.black12),
        color: color),
    child: Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          myText(title: title, size: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              myText(
                  title:
                  subTitle,
                  size: 3),
              Container(
                width: 9.vw,
                height: 12.vh,
                child: Image.asset(
                  urlImage,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}