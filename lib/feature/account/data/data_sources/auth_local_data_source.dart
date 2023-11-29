import 'package:nesma/core/common/entities/user/user_entity.dart';
import 'package:nesma/core/common/models/user/user_model.dart';
import 'package:nesma/core/managers/cash_manager/cash_keys.dart';
import 'package:nesma/core/managers/manager.dart';

abstract class AuthLocalDataSource {
  Future<void> cashUser(UserEntity user);

  Future<void> removeUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  @override
  Future<void> cashUser(UserEntity user) async {
    user as UserModel;
    await Managers.cashManager.store(CashKeys.user, user.toJson());
  }

  @override
  Future<void> removeUser() async =>
      await Managers.cashManager.remove(CashKeys.user);
}
