import 'package:nesma/core/managers/mapper/mapper.dart';
import 'package:nesma/core/network/api/api.dart';
import 'package:nesma/core/service_locator.dart';
import 'package:nesma/core/managers/cash_manager/cash_manager.dart';

class Managers {
  static Api api = getIt<Api>();
  static Mapper mapper = getIt<Mapper>();
  static CashManager cashManager = getIt<CashManager>();
}
