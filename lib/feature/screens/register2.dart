import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:register/feature/components/textComponent.dart';
import 'package:register/feature/components/textButtonComponent.dart';
import 'package:resize/resize.dart';
import '../controller/transProviderManager.dart';
import '../widgets/myText.dart';

class Register2 extends StatelessWidget {
  Register2({Key? key}) : super(key: key);
  TextEditingController verificationCode = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConformation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final form_key = GlobalKey<FormState>();

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "bro1.png",

          ),
          Container(
            height: 55.vh,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textComp("2","VeriFication ", "Please enter the code that we send to "),
                myText(title: "+90 531 999 00 11", size: 4, color: Color(0XffEE9CDA)),

                Form(
                  key: form_key,
                  child: Container(
                    height: 37.vh,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        textFiled("VeriFication Code", verificationCode),

                        textButtonComp("Resend the OTP in",  "5s"),
                       textFiled("Password", password),
                        textFiled("Password Conformation", passwordConformation),
                        Container(
                          width: 22.vw,
                          height: 6.vh,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.r),
                              color: Color(0XFF3879E9)),
                          child: TextButton(
                              onPressed: () {
                                print(verificationCode.text);
                                print(password.text);
                                print(passwordConformation.text);
                                Provider.of<CurrentProvider>(context,
                                    listen: false)
                                    .updateCurrentPage(3 );
                              },
                              child: Text(
                                'Proceed',
                                style: TextStyle(fontSize: 3.5.sp,color: Colors.white),
                              )),
                        )

                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget textFiled(String hintText,TextEditingController controller){
    return Container(
      width: 22.vw,
      height: 6.vh,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.r)),
          hintText: hintText,
          filled: true,
          hintStyle: TextStyle(
              fontSize:3.5.sp,
              color: Colors.black),
        ),
        style: TextStyle(
            fontSize: 3.5.sp,
            color: Colors.black),
        controller: controller,
      ),
    );
  }
}
