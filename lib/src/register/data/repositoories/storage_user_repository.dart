
import 'package:register/src/register/domain/models/user.dart';

abstract class StorageUserRepository{
  Future <void> crateStorageUsers({required User user});

}