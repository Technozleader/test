import 'package:nesma/core/common/entities/user/User_global.dart';
import 'package:nesma/core/common/enum/api_enums.dart';
import 'package:nesma/core/managers/manager.dart';
import 'package:nesma/core/network/api/api.dart';
import 'package:nesma/features/spendings_page/data/models/spending_model.dart';
import 'package:nesma/features/spendings_page/domain/entities/spending_entity.dart';

abstract class SpendingRemoteDataSource {
  Future<List<SpendingEntity>> getTotalSpending();

  Future<Map<DateTime, List<SpendingEntity>>> getMonthlySpending();
}

class SpendingRemoteDataSourceImpl extends SpendingRemoteDataSource {
  @override
  Future<List<SpendingEntity>> getTotalSpending() async {
    final request = ApiRequest(
        url: ApiURL.totalSpending,
        requestType: RequestType.get,
        headers: ApiParameters.headers(
          token: User.instance.userEntity?.token,
        ),
        params: ApiParameters.userId(
          User.instance.userEntity?.id.toString() ?? '',
        ));
    final response = await Managers.api.request(request);
    if (response.success) {
      final result = Managers.mapper.mapFromList<SpendingModel>(
        ((response.body ?? []) as Map<String , dynamic>)['data'],
        (json) => SpendingModel.fromJson(json as Map<String, dynamic>),
      );
      return result;
    } else {
      throw Exception(response.body?['message'] ?? 'Error');
    }
  }

  @override
  Future<Map<DateTime, List<SpendingEntity>>> getMonthlySpending() async {
    final request = ApiRequest(
        url: ApiURL.monthlySpending,
        requestType: RequestType.get,
        headers: ApiParameters.headers(
          token: User.instance.userEntity?.token,
        ),
        params: ApiParameters.userId(
          User.instance.userEntity?.id.toString() ?? '',
        ));
    final response = await Managers.api.request(request);
    if (response.success) {
      // Initialize a map to store the result, where keys are DateTimes and values are lists of SpendingEntity objects.
      final Map<DateTime, List<SpendingEntity>> result = {};

      // Extract the 'data' part of the JSON response.
      final jsonResponse = (response.body as Map<String, dynamic>)['data']
          as Map<String, dynamic>;

      // Iterate through the keys in the jsonResponse (which are Date strings).
      for (final key in jsonResponse.keys) {
        // Parse the list of SpendingModel objects from the JSON data.
        final listOfSpending = Managers.mapper.mapFromList<SpendingModel>(
          (jsonResponse[key] as List<dynamic>),
          (json) => SpendingModel.fromJson(json as Map<String, dynamic>),
        );

        // Convert the key (a Date string) into a DateTime object and store the list of SpendingModel objects in the result map.
        result[DateTime.parse(key)] = listOfSpending;
      }

      // Return the populated result map.
      return result;
    } else {
      // If the response is not successful, throw an Exception with an error message from the response, or a default 'Error' message if the response does not contain an error message.
      throw Exception(
        response.body?['message'] ?? 'Error',
      );
    }
  }
}
