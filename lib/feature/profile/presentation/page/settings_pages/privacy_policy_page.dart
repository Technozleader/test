import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesma/core/common/widgets/app_bar/nesma_app_bar.dart';
import 'package:nesma/core/common/widgets/background_widget.dart';
import 'package:nesma/core/common/widgets/loader.dart';
import 'package:nesma/core/common/widgets/no_data_widget.dart';
import 'package:nesma/core/extension/context_extension.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/service_locator.dart';
import 'package:nesma/features/profile/domain/entities/static_page.dart';
import 'package:nesma/features/profile/presentation/manager/profile_manager_bloc.dart';
import 'package:nesma/features/profile/presentation/widget/privacy_policy_widgets/privacy_policy_container.dart';
import 'package:sizer/sizer.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileManagerBloc>()
        ..add(
          const ProfileManagerEvent.getStaticPages(),
        ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar:  NesmaAppbar(pageName: "privacy_policy".tr),
        body: BackgroundWidget(
          child: BlocBuilder<ProfileManagerBloc, ProfileManagerState>(
            builder: (context, state) {
              if (state.getStaticPagesLoading) {
                return const Loader();
              } else if (state.staticPagesList.isNotEmpty) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: context.width * 0.1),
                        ..._buildItems(state.staticPagesList),
                      ],
                    ),
                  ),
                );
              } else {
                return const NoDataWidget();
              }
            },
          ),
        ),
      ),
    );
  }

  List<Widget> _buildItems(
      Map<String, List<StaticPageEntity>> staticPagesList) {
    final List<Widget> items = [];
    //extract all static pages entity from the map and convert them to widgets
    for (final list in staticPagesList.values) {
      items.addAll(
        list.map(
          (staticPage) => PrivacyPolicyContainer(
            title: staticPage.title,
            subtitle: staticPage.content,
          ),
        ),
      );
    }
    return items;
  }
}
