import 'package:get_it/get_it.dart';
import 'package:nesma/core/common/bloc/app_manager_cubit.dart';
import 'package:nesma/core/managers/cash_manager/cash_manager.dart';
import 'package:nesma/core/managers/mapper/mapper.dart';
import 'package:nesma/core/network/api/api.dart';
import 'package:nesma/core/network/network_connection.dart';
import 'package:nesma/features/account/data/data_sources/auth_remote_data_source.dart';
import 'package:nesma/features/account/data/data_sources/auth_local_data_source.dart';
import 'package:nesma/features/account/domain/repositories/auth_repository.dart';
import 'package:nesma/features/account/domain/use_cases/check_otp.dart';
import 'package:nesma/features/account/domain/use_cases/check_phone_use_case.dart';
import 'package:nesma/features/account/domain/use_cases/deactivate_account.dart';
import 'package:nesma/features/account/domain/use_cases/login.dart';
import 'package:nesma/features/account/domain/use_cases/logout.dart';
import 'package:nesma/features/account/domain/use_cases/sign_up.dart';
import 'package:nesma/features/account/presentation/manager/auth_bloc.dart';
import 'package:nesma/features/account/data/repositories/auth_repository_impl.dart';
import 'package:nesma/features/favorite/data/data_sources/favorite_local_data_source.dart';
import 'package:nesma/features/favorite/data/data_sources/favorite_remote_data_source.dart';
import 'package:nesma/features/favorite/data/repositories/favorite_data_repository.dart';
import 'package:nesma/features/favorite/domain/repositories/favorite_domain_repository.dart';
import 'package:nesma/features/favorite/domain/use_cases/get_favorite.dart';
import 'package:nesma/features/favorite/domain/use_cases/switch_favorite.dart';
import 'package:nesma/features/favorite/presentation/managers/favorite_bloc.dart';
import 'package:nesma/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:nesma/features/home/data/repositories/home_data_repository.dart';
import 'package:nesma/features/home/domain/repositories/home_domain_repository.dart';
import 'package:nesma/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:nesma/features/home/domain/use_cases/get_collection.dart';
import 'package:nesma/features/home/domain/use_cases/get_stores_by_category.dart';
import 'package:nesma/features/home/domain/use_cases/get_stores_by_collection_id.dart';
import 'package:nesma/features/home/presentation/managers/home_bloc/home_bloc.dart';
import 'package:nesma/features/home/presentation/managers/view_all_bloc/view_all_bloc.dart';
import 'package:nesma/features/offers/data/data_sources/offer_remote_data_source.dart';
import 'package:nesma/features/offers/data/repositories/offers_repository_impl.dart';
import 'package:nesma/features/offers/domain/repositories/offers_repository.dart';
import 'package:nesma/features/offers/domain/use_cases/cancel_offer.dart';
import 'package:nesma/features/offers/domain/use_cases/collect_offer.dart';
import 'package:nesma/features/offers/domain/use_cases/get_offer_history.dart';
import 'package:nesma/features/offers/domain/use_cases/get_offers_use_case.dart';
import 'package:nesma/features/offers/presentation/manager/offer_bloc.dart';
import 'package:nesma/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:nesma/features/profile/data/repositories/profile_data_repository.dart';
import 'package:nesma/features/profile/domain/repositories/profile_domain_repository.dart';
import 'package:nesma/features/profile/domain/use_cases/edit_profile.dart';
import 'package:nesma/features/profile/domain/use_cases/get_faqs.dart';
import 'package:nesma/features/profile/domain/use_cases/get_static_page.dart';
import 'package:nesma/features/profile/presentation/manager/profile_manager_bloc.dart';
import 'package:nesma/features/purchases/data/data_sources/purchase_remote_data_source.dart';
import 'package:nesma/features/purchases/data/repositories/purchase_data_repository.dart';
import 'package:nesma/features/purchases/domain/repositories/purchase_domain_repository.dart';
import 'package:nesma/features/purchases/domain/use_cases/get_incomplete_orders.dart';
import 'package:nesma/features/purchases/domain/use_cases/get_orders_history.dart';
import 'package:nesma/features/purchases/domain/use_cases/get_upcomping_payment.dart';
import 'package:nesma/features/purchases/presentation/manager/purchase_bloc.dart';
import 'package:nesma/features/spendings_page/data/data_sources/spending_remote_data_source.dart';
import 'package:nesma/features/spendings_page/data/repositories/spending_data_repo_impl.dart';
import 'package:nesma/features/spendings_page/domain/repositories/spending_domain_repo.dart';
import 'package:nesma/features/spendings_page/domain/use_cases/get_monthly_spending.dart';
import 'package:nesma/features/spendings_page/domain/use_cases/get_total_spending.dart';
import 'package:nesma/features/spendings_page/presentation/manager/spending_manager_bloc.dart';

final getIt = GetIt.instance;

void initServiceLocator() {
  getIt

    ///MANAGER
    ..registerSingleton<AppManagerCubit>(AppManagerCubit())

    ///FAVORITES
    ..registerSingleton<FavoriteRemoteDataSource>(
        FavoriteRemoteDataSourceImpl())
    ..registerSingleton<FavoriteLocalDataSource>(
      FavoriteLocalDataSourceImpl(),
    )
    ..registerSingleton<FavoriteDomainRepository>(
      FavoriteDataRepository(
          remoteDataSource: getIt(), localDataSource: getIt()),
    )
    ..registerSingleton(GetFavoriteUseCase(getIt()))
    ..registerSingleton(SwitchFavoriteUseCase(getIt()))
    ..registerFactory(() => FavoriteBloc(
          getFavoriteUseCase: getIt(),
          switchFavoriteUseCase: getIt(),
        ))

    ///SPENDING
    ..registerSingleton<SpendingRemoteDataSource>(
        SpendingRemoteDataSourceImpl())
    ..registerSingleton<SpendingDomainRepository>(SpendingDataRepository(
      remoteDataSource: getIt(),
    ))
    ..registerSingleton<GetTotalSpendingUseCase>(
        GetTotalSpendingUseCase(getIt()))
    ..registerSingleton(GetMonthlySpendingUseCase(getIt()))
    ..registerFactory(() => SpendingManagerBloc(
          getTotalSpendingUseCase: getIt(),
          getMonthlySpendingUseCase: getIt(),
        ))

    ///HOME
    ..registerSingleton<HomeRemoteDataSource>(HomeRemoteDataSourceImpl())
    ..registerSingleton<HomeDomainRepository>(
        HomeDataRepository(remoteDataSource: getIt()))
    ..registerSingleton(GetCategoriesUseCase(getIt()))
    ..registerSingleton(GetStoresByCategoryUseCase(getIt()))
    ..registerSingleton(GetCollectionUseCase(getIt()))
    ..registerSingleton(GetStoresByCollectionIdUseCase(getIt()))
    ..registerSingleton(HomeBloc(
      getCategoriesUseCase: getIt(),
      getCollectionUseCase: getIt(),
      switchFavoriteUseCase: getIt(),
    ))

    ///View all page
    ..registerFactory(() => ViewAllBloc(
          getStoresByCategoryUseCase: getIt(),
          switchFavoriteUseCase: getIt(),
          getStoresByCollectionIdUseCase: getIt(),
        ))

    ///AUTHENTICATION
    ..registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl())
    ..registerSingleton<AuthLocalDataSource>(AuthLocalDataSourceImpl())
    ..registerSingleton<AuthRepository>(AuthRepositoryImpl(
      remoteDataSource: getIt<AuthRemoteDataSource>(),
      localDataSource: getIt<AuthLocalDataSource>(),
    ))
    ..registerSingleton(CheckPhoneUseCase(getIt()))
    ..registerSingleton(LoginUseCase(getIt()))
    ..registerSingleton(SignupUseCase(getIt()))
    ..registerSingleton(LogoutUseCase(getIt()))
    ..registerSingleton(CheckOTPUseCase(getIt()))
    ..registerSingleton(DeactivateAccountUseCase(getIt()))
    ..registerFactory(() => AuthBloc(
          checkPhoneUseCase: getIt(),
          loginUseCase: getIt(),
          signupUseCase: getIt(),
          checkOTPUseCase: getIt(),
        ))

    ///PROFILE PAGE
    ..registerSingleton<ProfileRemoteDataSource>(ProfileRemoteDataSourceImpl())
    ..registerSingleton<ProfileDomainRepository>(ProfileDataRepository(
      remoteDataSource: getIt<ProfileRemoteDataSource>(),
      localDataSource: getIt(),
    ))
    ..registerSingleton(EditProfileUseCase(getIt()))
    ..registerSingleton(GetFAQsUseCase(getIt()))
    ..registerSingleton(GetStaticPageUseCase(getIt()))
    ..registerFactory(() => ProfileManagerBloc(
          getFAQsUseCase: getIt(),
          logoutUseCase: getIt(),
          deactivateAccountUseCase: getIt(),
          editProfileUseCase: getIt(),
          getStaticPageUseCase: getIt(),
        ))

    ///OFFER
    ..registerSingleton<OfferRemoteDataSource>(OfferRemoteDataSourceImpl())
    ..registerSingleton<OffersRepository>(OffersRepositoryImpl(
      remoteDataSource: getIt<OfferRemoteDataSource>(),
    ))
    ..registerSingleton(GetOffersUseCase(getIt()))
    ..registerSingleton(CollectOfferUseCase(getIt()))
    ..registerSingleton(GetOfferHistoryUseCase(getIt()))
    ..registerSingleton(CancelOfferUseCase(getIt()))
    ..registerFactory(() => OfferBloc(
          cancelOfferUseCase: getIt(),
          getOffersUseCase: getIt(),
          getCategoriesUseCase: getIt(),
          collectOfferUseCase: getIt(),
          getOfferHistoryUseCase: getIt(),
        ))

    ///UPCOMING PAYMENTS
    ..registerSingleton<PurchaseRemoteDataSource>(
        PurchaseRemoteDataSourceImpl())
    ..registerSingleton<PurchaseDomainRepository>(
        PurchaseDataRepository(remoteDataSource: getIt()))
    ..registerSingleton<GetUpcomingPaymentUseCase>(
        GetUpcomingPaymentUseCase(getIt()))
    ..registerSingleton<GetOrdersHistoryUseCase>(
        GetOrdersHistoryUseCase(getIt()))
    ..registerSingleton(GetIncompleteOrdersUseCase(getIt()))
    ..registerFactory(() => PurchaseBloc(
          getUpcomingPaymentUseCase: getIt(),
          getIncompleteOrdersUseCase: getIt(),
          getOrdersHistoryUseCase: getIt(),
        ))

    ///UTILS
    ..registerSingleton<NetworkConnection>(NetworkConnectionImpl())
    ..registerSingleton<Api>(ApiImpl())
    ..registerSingleton<Mapper>(Mapper())
    ..registerSingleton<CashManager>(CashManagerImpl());
}
