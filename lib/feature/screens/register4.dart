import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:register/feature/components/textComponent.dart';
import 'package:resize/resize.dart';
import '../controller/transProviderManager.dart';


class Register4 extends StatelessWidget {
  const Register4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "rafiki1.png",

          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textComp("4", "What is your gender?",
                  "To give you a better experience we need\n to know your Gender"),

              Container(
                width: 20.vw,
                height: 38.vh,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    InkWell(
                      child: Image.asset(
                        "Male.png",
                        width: 9.vw,
                        height: 38.vh,

                      ),
                    ),
                    InkWell(
                      child: Image.asset(
                        "Female.png",
                        width: 9.vw,
                        height: 38.vh,


                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 22.vw,
                height: 6.vh,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.r),
                    color: Color(0XFF3879E9)),
                child: TextButton(
                    onPressed: () {
                      Provider.of<CurrentProvider>(context,
                          listen: false)
                          .updateCurrentPage(4 );
                    },
                    child: Text(
                      'Proceed',
                      style: TextStyle(fontSize: 3.5.sp,color: Colors.white),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
