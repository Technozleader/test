import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesma/core/common/widgets/loader.dart';
import 'package:nesma/core/common/widgets/no_data_widget.dart';
import 'package:nesma/core/extension/spending_extension.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:nesma/features/spendings_page/presentation/manager/spending_manager_bloc.dart';
import 'package:nesma/features/spendings_page/presentation/widgets/chart_item_details_widget.dart';

class OverAllTimeWidget extends StatelessWidget {
  const OverAllTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          "over_all_time".tr,
          style: TextManager.headline1,
        ),
        BlocBuilder<SpendingManagerBloc, SpendingManagerState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Loader();
            } else if (state.spending.isNotEmpty) {
              final spending = state.spending;
              return Column(
                children: spending
                    .map((spendingItem) => ChartItemDetailsWidget(
                          chartData: spendingItem.toChartData,
                        ))
                    .toList(),
              );
            } else {
              return const NoDataWidget();
            }
          },
        )
      ],
    );
  }
}
