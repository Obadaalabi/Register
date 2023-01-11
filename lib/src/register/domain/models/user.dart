
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'user.freezed.dart';
part 'user.g.dart';
enum TypeOfAccount { patient, physiotherapist }
enum Gender {male, female }
@freezed
class User with _$User {

  const factory User({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
    required String verificationCode,
    required String password,
    required String passwordConformation,
    required TypeOfAccount typeOfAccount,
    required Gender gender,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
