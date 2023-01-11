

import 'package:flutter/material.dart';

import '../widgets/my_text.dart';

Widget textComp(String number,String title,String subTitle){
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          myText(title: number,size: 6,bold:FontWeight.bold),

          Padding(
            padding: const EdgeInsets.only(bottom: 7),
            child: myText(title: "/8", size: 4),
          )
        ],
      ),
      myText(title: title,size: 6,bold:FontWeight.bold),
      myText(title: subTitle, size: 4),

    ],
  );
}