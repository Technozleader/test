part of 'app_manager_cubit.dart';

class AppManagerState extends Equatable {
  final Locale? locale;
  final String? backgroundImagePath;
  final AppFlow appFlow;
  final String? stateDetails;

  const AppManagerState({
    this.locale,
    this.backgroundImagePath,
    this.appFlow = AppFlow.notLoggedIn,
    this.stateDetails,
  });

  AppManagerState copyWith({
    Locale? locale,
    String? backgroundImagePath,
    AppFlow? appFlow,
    String? stateDetails,
  }) {
    return AppManagerState(
      locale: locale ?? this.locale,
      backgroundImagePath: backgroundImagePath ?? this.backgroundImagePath,
      appFlow: appFlow ?? this.appFlow,
      stateDetails: stateDetails ?? this.stateDetails,
    );
  }

  @override
  List<Object?> get props => [
        locale,
        backgroundImagePath,
        appFlow,
        stateDetails,
      ];
}
