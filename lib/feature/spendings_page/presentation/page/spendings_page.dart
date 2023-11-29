import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesma/core/common/widgets/app_bar/nesma_app_bar.dart';
import 'package:nesma/core/common/widgets/background_widget.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/service_locator.dart';
import 'package:nesma/features/spendings_page/presentation/manager/spending_manager_bloc.dart';
import 'package:nesma/features/spendings_page/presentation/widgets/pie_chart_widget.dart';
import 'package:nesma/features/spendings_page/presentation/widgets/over_all_time_widget.dart';
import 'package:sizer/sizer.dart';

class SpendingsPage extends StatelessWidget {
  SpendingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SpendingManagerBloc>(
      create: (context) => getIt<SpendingManagerBloc>()
        ..add(const SpendingManagerEvent.getTotalSpending())
        ..add(const SpendingManagerEvent.getMonthlySpending()),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar:  NesmaAppbar(pageName: "spendings".tr),
        body: BackgroundWidget(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PieChartWidget(),
                  SizedBox(height: 3.h),
                  const OverAllTimeWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData({
    required this.name,
    required this.percent,
    required this.color,
    required this.money,
  });

  final String name;
  final double percent;
  final double money;
  final Color color;
}
