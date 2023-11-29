import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesma/core/extension/context_extension.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:nesma/features/spendings_page/presentation/manager/spending_manager_bloc.dart';
import 'package:nesma/features/spendings_page/presentation/widgets/spendings_chart_pie_widget.dart';
import 'package:sizer/sizer.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final manager =BlocProvider.of<SpendingManagerBloc>(context);
    return BlocBuilder<SpendingManagerBloc, SpendingManagerState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.width * 0.1),
            if (!state.isLoading)
              Text(
                "${manager.calculateTotalSpending()} SAR",
                style: TextManager.headline1,
              ),
            if (!state.monthlySpendingLoading)
               Text(
                "${manager.calculateFirstDate} ${'to_now'.tr}",
                style: TextManager.label1,
              ),
            SizedBox(height: 3.h),
            const SpendingsPieChartWidget(),
          ],
        );
      },
    );
  }
}
