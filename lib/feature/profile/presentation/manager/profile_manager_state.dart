part of 'profile_manager_bloc.dart';

@freezed
class ProfileManagerState with _$ProfileManagerState {
  const factory ProfileManagerState({
    final Failure? failure,
    final bool? logoutLoading,
    final bool? logoutSuccess,
    @Default(false) final bool getFAQLoading,
    @Default(false) final bool getStaticPagesLoading,
    @Default({}) final Map<String, List<FAQEntity>> faqList,
    @Default({}) final Map<String, List<StaticPageEntity>> staticPagesList,
    @Default(false) final bool? deactivateAccountLoading,
    @Default(false) final bool? deactivateAccountSuccess,
    @Default(false) final bool editProfileLoading,
    @Default(false) final bool editProfileSuccess,
  }) = _ProfileManagerState;
}
