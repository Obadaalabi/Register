import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:register/src/register/application/services/storage_user_service.dart';
import 'package:register/src/register/presentation/controllers/form_group_controller.dart';
import 'package:resize/resize.dart';
import 'package:toast/toast.dart';
import '../../domain/models/user.dart';
import '../components/text_component.dart';

class Register4 extends StatelessWidget {
  const Register4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          "rafiki1.png",
        ),
        Consumer(builder: (_, WidgetRef ref, __) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textComp("4", "What is your gender?",
                  "To give you a better experience we need\n to know your Gender"),
              SizedBox(
                  width: 20.vw,
                  height: 38.vh,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Container(
                          width: 8.vw,
                          height: 38.vh,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: ref.watch(selectGender) == 1
                                    ? const Color(0XFFE1E2EC)
                                    : const Color(0XFFFAFDFF),
                                width: 2,
                              )),
                          child: Image.asset(
                            "Male.png",
                          ),
                        ),
                        onTap: () {
                          ref.read(selectGender.notifier).state = 1;
                          ref.read(formGroupProvider).control("Gender").value =
                              Gender.male;
                        },
                      ),
                      InkWell(
                        child: Container(
                          width: 8.vw,
                          height: 38.vh,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: ref.watch(selectGender) == 2
                                    ? const Color(0XFFE1E2EC)
                                    : const Color(0XFFFAFDFF),
                                width: 2,
                              )),
                          child: Image.asset(
                            "Female.png",
                          ),
                        ),
                        onTap: () {
                          ref.read(selectGender.notifier).state = 2;
                          ref.read(formGroupProvider).control("Gender").value =
                              Gender.female;
                        },
                      ),
                    ],
                  )),
              Container(
                width: 22.vw,
                height: 6.vh,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.r),
                    color: const Color(0XFF3879E9)),
                child: TextButton(
                  onPressed: () async {
                    if (ref.watch(formGroupProvider).control("Gender").valid) {
                      //print(ref.watch(formGroupProvider).value);
                      await ref
                          .read(addUserService)
                          .addUser(ref.watch(formGroupProvider));
                      Toast.show("Account created successfully",
                          duration: Toast.lengthLong,
                          gravity: Toast.bottom,
                          backgroundColor: Colors.black);
                    } else {
                    //  print("error");
                      Toast.show("Please selected Gender",
                          duration: Toast.lengthLong,
                          gravity: Toast.bottom,
                          backgroundColor: Colors.black);
                    }
                  },
                  child: Text(
                    'Proceed',
                    style: TextStyle(fontSize: 3.5.sp, color: Colors.white),
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
