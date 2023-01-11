import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:register/src/register/presentation/controllers/form_group_controller.dart';
import 'package:resize/resize.dart';

Widget reactiveTextField(String hintText,String formControl){
  return SizedBox(
    width: 22.vw,
    height: 6.vh,
    child: Consumer(
      builder: (_, WidgetRef ref, __) {
        return ReactiveForm(
          formGroup:ref.watch(formGroupProvider) ,
          child: ReactiveTextField(
            formControlName: formControl,
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

          ),
        );
      }
    ),
  );
}