


import 'package:flutter/material.dart';

import '../widgets/my_text.dart';

Widget textButtonComp(String text,String textButton){
  return   Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      myText(title: text, size: 3.5),


      TextButton(
        onPressed: () {},
        child:myText(title:textButton, size: 3.5,color: const Color(0XffEE9CDA)),),

    ],
  );
}