import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:register/src/register/presentation/controllers/trans_provider_manager.dart';
import 'package:resize/resize.dart';
import 'registeration_template.dart';
import '../widgets/tab_list.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffE1E2EC),
        persistentFooterButtons: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'English  (uk) ',
                    style: TextStyle(fontSize: 5.sp),
                  ),
                  SizedBox(
                    width: 2.vw,
                  ),
                  Text('Turkce', style: TextStyle(fontSize: 5.sp)),
                  SizedBox(
                    width: 2.vw,
                  ),
                  Text('العربية', style: TextStyle(fontSize: 5.sp)),
                ],
              ),
              Consumer(
                builder: (_, WidgetRef ref, __) {
                  return ref.watch(currentPageProvider)==1? const Text("Copyright .All rights resered. Security usage terms    Cookie prefernces dont sell my peronal information"):const Text("");
                }
              ),

            ],
          ),


        ],
        appBar: AppBar(
          leading: Center(
              child: Text(
            'logo',
            style: TextStyle(
                color: Colors.black, fontFamily: 'Recoleta', fontSize: 8.sp),
          )),
          actions: [
            SizedBox(
              width: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Image(
                    image: AssetImage('icon_facebook.png'),
                  ),
                  Spacer(),
                  Image(
                    image: AssetImage('icons_whatsapp.png'),
                  ),
                  Spacer(),
                  Image(
                    image: AssetImage('icon_instagram.png'),
                  ),
                ],
              ),
            )
          ],
          backgroundColor: Colors.grey,
        ),
        body: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(
                  height: 6.vh,
                  width: double.infinity,
                  child: listTabbar(context)),
              const RegistrationTemplate(),
            ],
          ),
        ));
  }
}
