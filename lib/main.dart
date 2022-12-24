
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resize/resize.dart';
import 'feature/components/home.dart';
import 'feature/controller/transProviderManager.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Resize(
        allowtextScaling: true,
        builder: (){
      return ChangeNotifierProvider<CurrentProvider>(

          create:(ctx)=>CurrentProvider(),
          child: MaterialApp(

            theme: ThemeData(
              primarySwatch:Colors.grey,
              fontFamily: 'Recoleta',


            ),
            home: MyHomePage(),
            debugShowCheckedModeBanner: false,
          ));
    });
  }
}
