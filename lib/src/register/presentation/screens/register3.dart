import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:register/src/register/presentation/controllers/form_group_controller.dart';
import 'package:resize/resize.dart';
import 'package:toast/toast.dart';

import '../../domain/models/user.dart';
import '../components/text_component.dart';
import '../controllers/trans_provider_manager.dart';
import '../widgets/card_account.dart';

class Register3 extends StatelessWidget {
  const Register3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          "Characters.png",
        ),
        Consumer(builder: (_, WidgetRef ref, __) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              textComp("3", "Type oF Account ",
                  "Choose the type of your account, be\ncareful to hange it is impossible"),
              InkWell(
                child: cardAccount(
                    "I am a patient",
                    "Find a physiotherapist online,\nbook a session,  and more",
                    "rafiki.png",
                    color:ref.watch(selectAccount)==1?const Color(0XFFE1E2EC):const Color(0XFFFAFDFF)
                    ),
                onTap: () {
                  ref.read(selectAccount.notifier).state = 1;
                  ref.read(formGroupProvider).control("typeOfAccount").value =
                      TypeOfAccount.patient;
                },
              ),
              InkWell(
                child: cardAccount(
                  "I am a physiotherapist",
                  "Find  patients, agree on\nsessions, "
                      "and more",
                  "pana.png",
                  color: ref.watch(selectAccount)==2?const Color(0XFFE1E2EC):const Color(0XFFFAFDFF)
                ),
                onTap: () {
                  ref.read(selectAccount.notifier).state = 2;
                  ref.read(formGroupProvider).control("typeOfAccount").value =
                      TypeOfAccount.physiotherapist;
                },
              ),
              Container(
                width: 22.vw,
                height: 6.vh,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.r),
                    color: const Color(0XFF3879E9)),
                 child :TextButton(
                onPressed: () {
                  if (ref
                      .watch(formGroupProvider)
                      .control("typeOfAccount")
                      .valid)
                  {
                    // print(ref.watch(formGroupProvider).value);
                    ref.read(currentPageProvider.notifier).state++;
                  }
                  else {
                  //  print("error");
                    Toast.show("Please selected typeOfAccount",
                        duration: Toast.lengthLong,
                        gravity: Toast.bottom,
                        backgroundColor: Colors.black);
                  }

                },
                child: Text('Proceed', style: TextStyle(fontSize: 3.5.sp, color: Colors.white),
                ),
              ),
             )
            ],
          );
        })
      ],
    );
  }
}
