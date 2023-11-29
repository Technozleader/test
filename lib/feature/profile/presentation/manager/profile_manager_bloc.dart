import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nesma/core/failure/failure.dart';
import 'package:nesma/core/network/api/api.dart';
import 'package:nesma/features/account/domain/use_cases/deactivate_account.dart';
import 'package:nesma/features/account/domain/use_cases/logout.dart';
import 'package:nesma/features/profile/data/parameters/parameters.dart';
import 'package:nesma/features/profile/domain/entities/faq_entity.dart';
import 'package:nesma/features/profile/domain/entities/static_page.dart';
import 'package:nesma/features/profile/domain/use_cases/edit_profile.dart';
import 'package:nesma/features/profile/domain/use_cases/get_faqs.dart';
import 'package:nesma/features/profile/domain/use_cases/get_static_page.dart';

part 'profile_manager_event.dart';

part 'profile_manager_state.dart';

part 'profile_manager_bloc.freezed.dart';

class ProfileManagerBloc
    extends Bloc<ProfileManagerEvent, ProfileManagerState> {
  final LogoutUseCase logoutUseCase;
  final DeactivateAccountUseCase deactivateAccountUseCase;
  final EditProfileUseCase editProfileUseCase;
  final GetFAQsUseCase getFAQsUseCase;
  final GetStaticPageUseCase getStaticPageUseCase;

  ProfileManagerBloc({
    required this.logoutUseCase,
    required this.deactivateAccountUseCase,
    required this.editProfileUseCase,
    required this.getFAQsUseCase,
    required this.getStaticPageUseCase,
  }) : super(const ProfileManagerState()) {
    on<ProfileManagerEvent>((event, emit) async {
      switch (event.runtimeType) {
        case _$_Logout:
          await logout(event, emit);
          break;
        case _$_DeactivateAccount:
          await deactivateAccount(event, emit);
          break;
        case _$_EditProfile:
          await editProfile(event, emit);
          break;
        case _$_GetFAQ:
          await getFAQs(event, emit);
          break;
        case _$_GetStaticPages:
          await getStaticPage(event, emit);
          break;
      }
    });
  }

  Future<void> logout(
      ProfileManagerEvent event, Emitter<ProfileManagerState> emit) async {
    event as _$_Logout;
    emit(state.copyWith(
      logoutLoading: true,
      failure: null,
      logoutSuccess: null,
    ));
    final result = await logoutUseCase();
    result.fold(
      (failure) {
        emit(state.copyWith(
          logoutLoading: false,
          failure: failure,
        ));
      },
      (logoutSuccess) {
        emit(state.copyWith(
          logoutLoading: false,
          logoutSuccess: true,
        ));
      },
    );
  }

  Future<void> deactivateAccount(
      ProfileManagerEvent event, Emitter<ProfileManagerState> emit) async {
    event as _$_DeactivateAccount;
    emit(state.copyWith(
      deactivateAccountLoading: true,
      failure: null,
      deactivateAccountSuccess: null,
    ));
    final result = await deactivateAccountUseCase();
    result.fold(
      (failure) {
        emit(state.copyWith(
          deactivateAccountLoading: false,
          failure: failure,
        ));
      },
      (deactivateAccountSuccess) {
        emit(state.copyWith(
          deactivateAccountLoading: false,
          deactivateAccountSuccess: true,
        ));
      },
    );
  }

  Future<void> editProfile(
      ProfileManagerEvent event, Emitter<ProfileManagerState> emit) async {
    event as _$_EditProfile;
    emit(state.copyWith(
      editProfileLoading: true,
      failure: null,
      editProfileSuccess: false,
    ));
    final result = await editProfileUseCase(
      parameters: event.parameters,
      mediaOption: event.mediaOption,
    );
    result.fold(
      (failure) {
        emit(state.copyWith(
          editProfileLoading: false,
          failure: failure,
        ));
      },
      (editProfileSuccess) {
        emit(state.copyWith(
          editProfileLoading: false,
          editProfileSuccess: true,
        ));
      },
    );
  }

  Future<void> getFAQs(
      ProfileManagerEvent event, Emitter<ProfileManagerState> emit) async {
    event as _$_GetFAQ;
    emit(state.copyWith(
      getFAQLoading: true,
      failure: null,
    ));
    final result = await getFAQsUseCase();
    result.fold(
      (failure) {
        emit(state.copyWith(
          getFAQLoading: false,
          failure: failure,
        ));
      },
      (faqList) {
        emit(state.copyWith(
          getFAQLoading: false,
          faqList: _orderFAQList(faqList),
        ));
      },
    );
  }

  Map<String, List<FAQEntity>> _orderFAQList(List<FAQEntity> faqList) {
    final Set<String> groups = faqList.map((faq) => faq.group).toSet();
    final Map<String, List<FAQEntity>> faqMap = {}..addEntries(
        groups.map(
          (groupName) => MapEntry(
            groupName,
            faqList.where((faq) => faq.group == groupName).toList(),
          ),
        ),
      );
    return faqMap;
  }

  Future<void> getStaticPage(
      ProfileManagerEvent event, Emitter<ProfileManagerState> emit) async {
    event as _$_GetStaticPages;
    emit(
      state.copyWith(
        getStaticPagesLoading: true,
        failure: null,
      ),
    );
    final result = await getStaticPageUseCase();
    result.fold((failure) {
      emit(
        state.copyWith(
          getStaticPagesLoading: false,
          failure: failure,
        ),
      );
    }, (staticPages) {
      emit(
        state.copyWith(
          getStaticPagesLoading: false,
          staticPagesList: staticPages,
        ),
      );
    });
  }
}
