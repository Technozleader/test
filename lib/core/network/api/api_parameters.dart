part of 'api.dart';

class ApiURL {
  static const String baseURL = 'xxxxxxxxxxxxxxxxxxxxx';
  static const String urlVersion = 'v1';

  static const String backgroundImage =
      'https://b-card.online/public/assets/img/AppBg/bg.png';

  static const String checkPhone = '$baseURL/check_phone';

  static const String login = '$baseURL/login';

  static const String singUp = '$baseURL/sign_up';

  static const String getOffers = '$baseURL/$urlVersion/offers';

  static const String categories = '$baseURL/$urlVersion/categories';

  static const String categoryStores = '$baseURL/$urlVersion/category_stores';

  static const String collections = '$baseURL/$urlVersion/collections';

  static const String favorite = '$baseURL/$urlVersion/favorites';

  static const String addFavorite = '$baseURL/$urlVersion/add_to_favorite';

  static const String logout = '$baseURL/$urlVersion/logout';

  static const String collectOffer = '$baseURL/$urlVersion/collect_offer';

  static const String getOffersHistory = '$baseURL/$urlVersion/offers_history';

  static const String upcomingPayments =
      '$baseURL/$urlVersion/upcoming_payments';

  static const String inCompleteOrders =
      '$baseURL/$urlVersion/incomplete_orders';

  static const String ordersHistory = '$baseURL/$urlVersion/orders_history';

  static const String deactivateAccount =
      '$baseURL/$urlVersion/deactivate_account';

  static const String editProfile = '$baseURL/$urlVersion/edit_profile';

  static const String collectionsStores =
      '$baseURL/$urlVersion/collection_stores';

  static const String checkOTP = '$baseURL/check_otp';

  static const String totalSpending = '$baseURL/$urlVersion/total_spendings';

  static const String cancelOffers = '$baseURL/$urlVersion/offer_cancel';

  static const String getFAQs = '$baseURL/$urlVersion/faq';

  static const String staticPages = '$baseURL/$urlVersion/static_pages';

  static const String changePassword = '$baseURL/$urlVersion/change_password';

  static const String monthlySpending =
      '$baseURL/$urlVersion/monthly_spendings';
}

class ApiParameters {
  static Map<String, dynamic> headers({
    String? token,
  }) =>
      {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token'
      };

  static Map<String, dynamic> checkPhone(String phone) => {
        'phone': phone,
      };

  static Map<String, dynamic> login(String phone, String password) => {
        'phone': phone,
        'password': password,
      };

  static Map<String, dynamic> signup(SignupParameters parameters) => {
        'phone': parameters.phone,
        'password': parameters.password,
        'name': parameters.name,
        'email': parameters.email,
        'last_name': parameters.lastName,
      };

  static Map<String, dynamic> userId(String id) => {
        'user_id': id,
      };

  static Map<String, dynamic> categoryStores(
          {required int categoryId, int? userId}) =>
      {
        'category_id': categoryId,
        'user_id': userId,
      };

  static Map<String, dynamic> userAndStoreId(
          {required int storeId, int? userId}) =>
      {
        'user_id': userId,
        'store_id': storeId,
      };

  static Map<String, dynamic> collectOffer(
          {int? userId, required int offerId}) =>
      {
        'user_id': userId,
        'offer_id': offerId,
      };

  static Map<String, dynamic> editProfileParameters(
          {required EditProfileParameters editProfileParameters,
          int? userId}) =>
      {
        if (userId != null) 'user_id': userId,
        if (editProfileParameters.name != null)
          'name': editProfileParameters.name,
        if (editProfileParameters.email != null)
          'email': editProfileParameters.email,
        if (editProfileParameters.lastName != null)
          'last_name': editProfileParameters.lastName,
        if (editProfileParameters.phone != null)
          'phone': editProfileParameters.phone,
      };

  static Map<String, dynamic> collectionsStores({
    required int collectionId,
    int? userId,
  }) =>
      {
        'collection_id': collectionId,
        'user_id': userId,
      };

  static Map<String, dynamic> checkOTP(String phoneNumber, String otp) => {
        'phone': phoneNumber,
        'code': otp,
      };

  static Map<String, dynamic> userAndOfferId({
    required int? userId,
    required int offerId,
  }) =>
      {
        'user_id': userId,
        'offer_id': offerId,
      };

  static Map<String, dynamic> changePasswordParameters({
    int? userId,
    required String newPassword,
  }) =>
      {
        'user_id': userId,
        'new_pass': newPassword,
      };
}
