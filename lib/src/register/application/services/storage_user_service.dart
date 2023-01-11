import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:register/src/register/data/repositoories/firestore_storage_users_repository.dart';
import '../../domain/models/user.dart';


final addUserService=Provider<StorageUserService>((ref){
  return StorageUserService(FirestoreStorageUsersRepository());});


class StorageUserService {
  final FirestoreStorageUsersRepository _firestoreStorageUsersRepository;
  late final User user;

  StorageUserService(this._firestoreStorageUsersRepository);



  Future<void> addUser(FormGroup formGroup) async {
    user =  User(
        firstName:formGroup.control("firstName").value,
        lastName:formGroup.control("lastName").value ,
        phoneNumber: formGroup.control("phoneNumber").value ,
        email:formGroup.control("email").value  ,
        verificationCode:formGroup.control("verificationCode").value  ,
        password:formGroup.control("password").value  ,
        passwordConformation:formGroup.control("passwordConformation").value  ,
        typeOfAccount:formGroup.control("typeOfAccount").value ,
        gender:formGroup.control("Gender").value );
    await _firestoreStorageUsersRepository.crateStorageUsers(user: user);
  }
}