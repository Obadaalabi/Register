import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:register/src/register/presentation/controllers/form_group_controller.dart';
import 'package:register/src/register/presentation/widgets/reactive_text_field.dart';
import 'package:resize/resize.dart';
import 'package:toast/toast.dart';
import '../components/text_button_component.dart';
import '../components/text_component.dart';
import '../controllers/clock_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/trans_provider_manager.dart';
import '../widgets/my_text.dart';

class Register2 extends StatelessWidget {
  const Register2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          "bro1.png",
        ),
        SizedBox(
          height: 55.vh,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textComp("2", "VeriFication ",
                  "Please enter the code that we send to "),
              Consumer(builder: (_, WidgetRef ref, __) {
                return myText(
                    title: ref
                        .watch(formGroupProvider)
                        .control("phoneNumber")
                        .value,
                    size: 4,
                    color: const Color(0XffEE9CDA));
              }),
              SizedBox(
                height: 37.vh,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    reactiveTextField("VeriFication Code", "verificationCode"),
                    Consumer(builder: (_, WidgetRef ref, __) {
                      return textButtonComp(
                          "Resend the OTP in", "${ref.watch(clockProvider)}s");
                    }),
                    reactiveTextField("Password", "password"),
                    reactiveTextField(
                        "Password Conformation", "passwordConformation"),
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
                          onPressed: () async {
                            if (ref
                                    .watch(formGroupProvider)
                                    .control("verificationCode")
                                    .valid &&
                                ref
                                    .watch(formGroupProvider)
                                    .control("password")
                                    .valid &&
                                ref
                                    .watch(formGroupProvider)
                                    .control("passwordConformation")
                                    .valid) {
                              //print(ref.watch(formGroupProvider).value);
                              bool verifyOtp = await ref
                                  .read(loginControl)
                                  .verifyOtp(ref
                                      .watch(formGroupProvider)
                                      .control("verificationCode")
                                      .value);
                              if (verifyOtp==true) {
                                ref.read(currentPageProvider.notifier).state++;
                              } else {
                                Toast.show(
                                    "Please enter the correct verification code",
                                    duration: Toast.lengthLong,
                                    gravity: Toast.bottom,
                                    backgroundColor: Colors.black);
                              }
                            } else {
                              //print("error");
                              Toast.show("Please enter all required data",
                                  duration: Toast.lengthLong,
                                  gravity: Toast.bottom,
                                  backgroundColor: Colors.black);
                            }
                          },
                          child: Text(
                            'Proceed',
                            style: TextStyle(
                                fontSize: 3.5.sp, color: Colors.white),
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
