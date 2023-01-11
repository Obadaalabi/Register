import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:register/src/register/presentation/controllers/trans_provider_manager.dart';
import 'package:resize/resize.dart';
import '../screens/register1.dart';
import '../screens/register2.dart';
import '../screens/register3.dart';
import '../screens/register4.dart';

class RegistrationTemplate extends StatelessWidget {
 const RegistrationTemplate({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      height: 65.vh,
      child:Consumer(
        // 2. specify the builder and obtain a WidgetRef
          builder: (_, WidgetRef ref, __) {

            return curentRegister(ref.watch(currentPageProvider));

        })
      );
  }

  Widget curentRegister(int curentPage) {
    Widget? current;
    switch(curentPage){
      case 1:
        current=const Register1();
        break;
      case 2:
        current=const Register2();
        break;
        case 3:
        current=const Register3();
        break;
        case 4:
        current=const Register4();
        break;

    }



    return current!;
  }
}
