
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../domain/models/user.dart';

final formGroupProvider=Provider<FormGroup>((ref){
return FormGroup({
'firstName': FormControl<String>(value: "",validators: [Validators.required]),
'lastName': FormControl<String>(value: "",validators: [Validators.required]),
'phoneNumber': FormControl<String>(validators: [Validators.required]),
'email': FormControl<String>(value: '', validators: [Validators.required, Validators.email]),
  'verificationCode': FormControl<String>(validators: [Validators.required]),
'password': FormControl<String>(validators: [Validators.required]),
'passwordConformation': FormControl<String>(validators: [Validators.required]),
'typeOfAccount': FormControl<TypeOfAccount>(validators: [Validators.required],value: null),
'Gender': FormControl<Gender>(validators: [Validators.required],value: null),
}
    , validators: [
      Validators.mustMatch('password', 'passwordConformation'),
    ]
);});

final selectGender=StateProvider<int>((ref) {
return 0;});


final selectAccount=StateProvider<int>((ref) {
  return 0;});

