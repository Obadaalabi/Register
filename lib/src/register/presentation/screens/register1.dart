import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:register/src/register/presentation/controllers/form_group_controller.dart';
import 'package:register/src/register/presentation/controllers/trans_provider_manager.dart';
import 'package:register/src/register/presentation/widgets/reactive_text_field.dart';
import 'package:resize/resize.dart';
import 'package:toast/toast.dart';

import '../components/text_button_component.dart';
import '../components/text_component.dart';
import '../controllers/login_controller.dart';

class Register1 extends StatelessWidget {
  const Register1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          "bro.png",
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textComp("1", "Registration",
                "Please enter your information\nthen we will send OTP to verify"),
            SizedBox(
              height: 45.vh,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  reactiveTextField("First Name", "firstName"),
                  reactiveTextField("Last Name", "lastName"),
                  reactiveTextField("Phone Number", "phoneNumber"),
                  reactiveTextField("Email", "email"),
                  Container(
                    width: 22.vw,
                    height: 6.vh,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.r),
                        color: const Color(0XFF3879E9)),
                    child: Consumer(
                        // 2. specify the builder and obtain a WidgetRef
                        builder: (_, WidgetRef ref, __) {
                      return TextButton(
                        onPressed: () {
                          if (ref
                                  .watch(formGroupProvider)
                                  .control("firstName")
                                  .valid &&
                              ref
                                  .watch(formGroupProvider)
                                  .control("lastName")
                                  .valid &&
                              ref
                                  .watch(formGroupProvider)
                                  .control("phoneNumber")
                                  .valid &&
                              ref
                                  .watch(formGroupProvider)
                                  .control("email")
                                  .valid) {
                            ref.read(loginControl).verifyPhone(ref
                                .watch(formGroupProvider)
                                .control("phoneNumber")
                                .value);
                           // print(ref.watch(formGroupProvider).value);
                            ref.read(currentPageProvider.notifier).state++;
                          } else {
                         //   print("error");
                            Toast.show("Please enter all required data",
                                duration: Toast.lengthLong,
                                gravity: Toast.bottom,backgroundColor:Colors.black );
                          }
                        },
                        child: Text(
                          'Proceed',
                          style:
                              TextStyle(fontSize: 3.5.sp, color: Colors.white),
                        ),
                      );
                    }),
                  ),
                  textButtonComp("Already have account?", "Login"),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
