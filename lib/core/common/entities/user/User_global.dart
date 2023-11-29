import 'package:nesma/core/common/entities/user/user_entity.dart';

class User {
  UserEntity? userEntity;

  User._internal();

  static User instance = User._internal();
}
