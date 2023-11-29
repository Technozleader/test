import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesma/core/common/widgets/app_bar/nesma_app_bar.dart';
import 'package:nesma/core/common/widgets/background_widget.dart';
import 'package:nesma/core/common/widgets/loader.dart';
import 'package:nesma/core/common/widgets/no_data_widget.dart';
import 'package:nesma/core/extension/context_extension.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:nesma/core/service_locator.dart';
import 'package:nesma/features/profile/domain/entities/faq_entity.dart';
import 'package:nesma/features/profile/presentation/manager/profile_manager_bloc.dart';
import 'package:nesma/features/profile/presentation/widget/faq_widgets/custom_expansion_container.dart';
import 'package:sizer/sizer.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileManagerBloc>()
        ..add(
          const ProfileManagerEvent.getFAQ(),
        ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar:  NesmaAppbar(pageName: "faq".tr),
        body: BackgroundWidget(
          child: BlocBuilder<ProfileManagerBloc, ProfileManagerState>(
            builder: (context, state) {
              if (state.getFAQLoading) {
                return const Loader();
              } else if (state.faqList.isNotEmpty) {
                final faqList = state.faqList;
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: context.width * 0.1),
                        ..._buildFAQWidget(faqList),
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

  List<Widget> _buildFAQWidget(Map<String, List<FAQEntity>> faqList) {
    final List<Widget> faqWidgets = [];
    faqList.forEach((groupName, questionList) {
      faqWidgets.add(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(groupName, style: TextManager.headline1),
          Column(
            children: questionList
                .map((question) => CustomExpansionContainer(
                      header: question.question,
                      answer: question.answer,
                    ))
                .toList(),
          ),
        ],
      ));
    });
    return faqWidgets;
  }
}
