import 'package:flutter/material.dart';
import 'package:resize/resize.dart';
import 'registerationTemplate.dart';
import '../widgets/tabList.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Color(0xffE1E2EC),

        persistentFooterButtons: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('English  (uk) ',style: TextStyle(fontSize: 5.sp),),
              SizedBox(width: 2.vw,),
              Text('Turkce',style: TextStyle(fontSize: 5.sp)),
              SizedBox(width: 2.vw,),
              Text('العربية',style: TextStyle(fontSize: 5.sp)),
            ],
          )


        ],
        appBar: AppBar(
          leading: Center(
              child: Text(
                'logo',
                style: TextStyle(color: Colors.black,fontFamily: 'Recoleta',fontSize: 8.sp),
              )),
          actions: [
            Container(

              width:120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              Image(image: AssetImage('icon_facebook.png'),),
              Spacer(),
              Image(image:  AssetImage('icons_whatsapp.png'),),

                  Spacer(),
              Image(image: AssetImage('icon_instagram.png'),),


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
              Container(
                height: 6.vh,
                width: double.infinity,
                child: listTabbar(context)
              ),
               RegistrationTemplate(),

            ],
          ),
        ));
  }


}
