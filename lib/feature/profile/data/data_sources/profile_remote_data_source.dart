import 'package:nesma/core/common/entities/user/User_global.dart';
import 'package:nesma/core/common/entities/user/user_entity.dart';
import 'package:nesma/core/common/enum/api_enums.dart';
import 'package:nesma/core/common/models/user/user_model.dart';
import 'package:nesma/core/managers/manager.dart';
import 'package:nesma/core/network/api/api.dart';
import 'package:nesma/features/profile/data/models/faq_model.dart';
import 'package:nesma/features/profile/data/models/static_page_model.dart';
import 'package:nesma/features/profile/data/parameters/parameters.dart';
import 'package:nesma/features/profile/domain/entities/faq_entity.dart';
import 'package:nesma/features/profile/domain/entities/static_page.dart';

abstract class ProfileRemoteDataSource {
  Future<UserEntity> editProfile({
    required EditProfileParameters editProfileParameters,
    MediaOption? mediaOptions,
  });

  Future<List<FAQEntity>> getFAQs();

  Future<Map<String, List<StaticPageEntity>>> getStaticPages();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  @override
  Future<UserEntity> editProfile({
    required EditProfileParameters editProfileParameters,
    MediaOption? mediaOptions,
  }) async {
    final request = ApiRequest(
      url: ApiURL.editProfile,
      requestType: RequestType.put,
      headers: ApiParameters.headers(
        token: User.instance.userEntity?.token,
      ),
      params: ApiParameters.editProfileParameters(
        editProfileParameters: editProfileParameters,
        userId: User.instance.userEntity?.id,
      ),
      media: mediaOptions,
    );
    final response = await Managers.api.request(request);
    if (response.success) {
      final json = ((response.body ?? {}) as Map<String, dynamic>)['data']
          as Map<String, dynamic>;
      json.addAll({
        UserEntityKeys.token: User.instance.userEntity?.token ?? '',
      });
      final user = Managers.mapper.mapFromJson(
        {'data': json},
        UserModel.fromJson,
      );
      return user;
    } else {
      throw Exception(
        response.body?['message'] ?? "Error while updating profile",
      );
    }
  }

  @override
  Future<List<FAQEntity>> getFAQs() async {
    final request = ApiRequest(
      url: ApiURL.getFAQs,
      requestType: RequestType.get,
      headers: ApiParameters.headers(
        token: User.instance.userEntity?.token,
      ),
    );
    final response = await Managers.api.request(request);
    if (response.success) {
      final json = ((response.body ?? {}) as Map<String, dynamic>)['data']
          as List<dynamic>;
      final faqs = Managers.mapper.mapFromList<FAQModel>(
        json,
        (json) => FAQModel.fromJson(json as Map<String, dynamic>),
      );
      return faqs;
    } else {
      throw Exception(
        response.body?['message'] ?? "Error while getting faqs",
      );
    }
  }

  @override
  Future<Map<String, List<StaticPageEntity>>> getStaticPages() async {
    final request = ApiRequest(
      url: ApiURL.staticPages,
      requestType: RequestType.get,
      params:
          ApiParameters.userId(User.instance.userEntity?.id.toString() ?? ''),
      headers: ApiParameters.headers(
        token: User.instance.userEntity?.token,
      ),
    );
    final response = await Managers.api.request(request);
    if (response.success) {
      final Map<String, List<StaticPageEntity>> resultMap = {};
      final json = ((response.body ?? {}) as Map<String, dynamic>)['data']
          as Map<String, dynamic>;
      for (final key in json.keys) {
        final jsonStaticPages = json[key] as List<dynamic>;
        final staticPages = Managers.mapper.mapFromList<StaticPageModel>(
          jsonStaticPages,
          (json) => StaticPageModel.fromJson(json as Map<String, dynamic>),
        );
        resultMap[key] = staticPages;
      }
      return resultMap;
    } else {
      throw Exception(
        response.body?['message'] ?? "Error while getting static pages",
      );
    }
  }
}
