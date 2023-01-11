import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginControl=Provider<LoginControl>((ref){
  return LoginControl();});

class LoginControl {
  var authState = "";
  String verificationId = '';
  var auth = FirebaseAuth.instance;

  verifyPhone(String phone) async {
    await auth.verifyPhoneNumber(
        timeout: const Duration(seconds: 40),
        phoneNumber: phone,
        verificationCompleted: (AuthCredential authCredential) {},
        verificationFailed: (authException) {
          const SnackBar(content: Text("error problem when send the code"),);
        },
        codeSent: (verificationId, forceResendingToken) {
          this.verificationId = verificationId;
          authState = "login Succes";
        },
        codeAutoRetrievalTimeout: (id) {
          verificationId = id;
        });
  }

  verifyOtp  <bool> (String otp) async {
    var credential=await auth.signInWithCredential(PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp));
    if(credential.user !=null){
      return true;
    }
    else {
      return false;
    }

  }


}