part of 'profile_manager_bloc.dart';

@freezed
class ProfileManagerEvent with _$ProfileManagerEvent {
  const factory ProfileManagerEvent.logout() = _Logout;

  const factory ProfileManagerEvent.deactivateAccount() = _DeactivateAccount;

  const factory ProfileManagerEvent.editProfile({
    required EditProfileParameters parameters,
    MediaOption? mediaOption,
  }) = _EditProfile;

  const factory ProfileManagerEvent.getFAQ() = _GetFAQ;

  const factory ProfileManagerEvent.getStaticPages() = _GetStaticPages;
}
