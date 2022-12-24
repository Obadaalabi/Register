import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:register/feature/components/textComponent.dart';
import 'package:register/feature/components/textButtonComponent.dart';
import 'package:resize/resize.dart';

import '../controller/transProviderManager.dart';

class Register1 extends StatelessWidget {
   Register1({Key? key}) : super(key: key);
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    final form_key = GlobalKey<FormState>();
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "bro.png",


          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             textComp("1","Registration",
                 "Please enter your information\nthen we will send OTP to verify"),
              Form(
                key: form_key,
                child: Container(

                  height: 45.vh,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      textFiled("First Name", firstName),
                      textFiled("Last Name", lastName),
                      textFiled("Phone Number", phoneNumber),
                      textFiled("Email", email),
                      Container(
                        width: 22.vw,
                        height: 6.vh,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.r),
                            color: Color(0XFF3879E9)),
                        child: TextButton(
                            onPressed: () {
                              print(firstName.text);
                              print(lastName.text);
                              print(phoneNumber.text);
                              print(email.text);

                              Provider.of<CurrentProvider>(context,
                                  listen: false)
                                  .updateCurrentPage(2 );
                            },
                            child: Text(
                              'Proceed',
                              style: TextStyle(fontSize: 3.5.sp,color: Colors.white),
                            )),
                      ),

                      textButtonComp("Already have account?", "Login"),

                    ],
                  ),
                ),
              ),
            ],
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
