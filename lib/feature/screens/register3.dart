import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:register/feature/components/textComponent.dart';
import 'package:register/feature/widgets/cardAccount.dart';
import 'package:resize/resize.dart';
import '../controller/transProviderManager.dart';

class Register3 extends StatelessWidget {
  const Register3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "Characters.png",
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              textComp("3", "Type oF Account ",
                  "Choose the type of your account, be\ncareful to hange it is impossible"),
              InkWell(
                child: cardAccount(
                    "I am a patient",
                    "Find a physiotherapist online,\nbook a session,  and more",
                    "rafiki.png",
                    color: Color(0XFFFAFDFF)),
              ),
              InkWell(
                child: cardAccount(
                  "I am a physiotherapist",
                  "Find  patients, agree on\nsessions, "
                      "and more",
                  "pana.png",
                  color: Color(0XFFE1E2EC),
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
                      Provider.of<CurrentProvider>(context, listen: false)
                          .updateCurrentPage(4);
                    },
                    child: Text(
                      'Proceed',
                      style: TextStyle(fontSize: 3.5.sp, color: Colors.white),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
