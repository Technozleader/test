import 'package:auto_route/auto_route.dart';
import 'package:eduorizen_app/core/managers/route_manager/routes.dart';
import 'package:eduorizen_app/core/managers/service_locator/injection.dart';
import 'package:eduorizen_app/feature/feed/presentation/feed_detials_bloc/feed_detials_bloc.dart';
import 'package:eduorizen_app/feature/office/presentation/pages/office_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage(name: Routes.accountDetailsPage)
class AccountDetailsPage extends StatelessWidget {
  final String uid;
  const AccountDetailsPage({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: getIt<FeedDetailsBloc>()
          ..add(FeedDetailsEvent.getFeedAccountDetials(uid: uid)),
        child: BlocBuilder<FeedDetailsBloc, FeedDetailsState>(
          buildWhen: (previous, current) {
            if (current.runtimeType ==
                const FeedDetailsState.feedAccountDetialsFetched()
                    .runtimeType) {
              return true;
            }
            if (current.runtimeType ==
                const FeedDetailsState.feedAccountDetialsLoading()
                    .runtimeType) {
              return true;
            }
            return false;
          },
          builder: (context, state) => state.maybeMap(
            orElse: () => const Offstage(),
            feedAccountDetialsLoading: (value) =>
                const Center(child: CircularProgressIndicator()),
            feedAccountDetialsFetched: (value) {
              return OfficeProfilePage(
                officeInfoEntity: value.officeInfo!,
              );
            },
          ),
        ),
      ),
    );
  }
}
