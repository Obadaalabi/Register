import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:register/src/register/data/repositoories/storage_user_repository.dart';
import 'package:register/src/register/domain/models/user.dart';


final firestoreStorageUsersRepositoryProvider=Provider<FirestoreStorageUsersRepository>((ref){
  return FirestoreStorageUsersRepository();
});

class FirestoreStorageUsersRepository implements StorageUserRepository{

  final CollectionReference _storUser=FirebaseFirestore.instance.collection("Users");
  @override
  Future<void> crateStorageUsers({required User user}) async {


    await _storUser.doc().set(user.toJson());

    }
  }


