


import 'package:flutter/material.dart';

import '../widgets/myText.dart';

Widget textButtonComp(String text,String textButton){
  return   Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      myText(title: text, size: 3.5),


      TextButton(
        onPressed: () {},
        child:myText(title:textButton, size: 3.5,color: Color(0XffEE9CDA)),),

    ],
  );
}