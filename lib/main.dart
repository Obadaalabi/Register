
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resize/resize.dart';
import 'package:toast/toast.dart';
import 'firebase_options.dart';
import 'src/register/presentation/components/home.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Resize(
        allowtextScaling: true,
        builder: (){
      return  MaterialApp(

        theme: ThemeData(
          primarySwatch:Colors.grey,
          fontFamily: 'Recoleta',


        ),
        home: const MyHomePage(),
        debugShowCheckedModeBanner: false,
      );});
  }
}
