import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resize/resize.dart';

import '../controller/transProviderManager.dart';
import '../screens/register1.dart';
import '../screens/register2.dart';
import '../screens/register3.dart';
import '../screens/register4.dart';

class RegistrationTemplate extends StatelessWidget {
 RegistrationTemplate({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: double.infinity,
      height: 65.vh,
      child:Consumer<CurrentProvider>(
        builder: (ctx, data, child) {
          return curentRegister(data.currentPage);

        })
      );
  }

  Widget curentRegister(int curentPage) {
    Widget? current;
    switch(curentPage){
      case 1:
        current=Register1();
        break;
      case 2:
        current=Register2();
        break;
        case 3:
        current=Register3();
        break;
        case 4:
        current=Register4();
        break;

    }



    return current!;
  }
}
