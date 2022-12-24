import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resize/resize.dart';

import '../controller/transProviderManager.dart';
List<String> items = [
  'Home page',
  'Services',
  'About us ',
  'Contact',
  'Registration',
];

Widget listTabbar(BuildContext context) {

  return  ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: items.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, index) {
        return GestureDetector(
          onTap: () {
            Provider.of<CurrentProvider>(context, listen: false).updatecurrenttab(index);

          },
          child:Consumer<CurrentProvider>(
              builder: (ctx, data, child) {
                return   AnimatedContainer(
                  duration: Duration(milliseconds: 10),
                  margin: EdgeInsets.all(5),
                  width: 7.vw,
                  height: 4.vh,
                  decoration: BoxDecoration(

                      border: Border(
                          bottom: BorderSide(
                              color: data.currentTab == index
                                  ? Color(0xffEE9CDA)
                                  : Colors.white,
                              width: 0.3.vw))),
                  child: Center(
                    child: Text(items[index],style: TextStyle(fontWeight: FontWeight.bold, fontSize:4.sp),),
                  ),
                );

              })



        );
      });


}