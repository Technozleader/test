import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nesma/core/common/widgets/glass_effect_widget.dart';
import 'package:nesma/core/common/widgets/loader.dart';
import 'package:nesma/core/common/widgets/no_data_widget.dart';
import 'package:nesma/core/managers/size_manager/font_size_manager.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:nesma/features/spendings_page/domain/entities/spending_entity.dart';
import 'package:nesma/features/spendings_page/presentation/manager/spending_manager_bloc.dart';
import 'package:nesma/features/spendings_page/presentation/page/spendings_page.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SpendingsPieChartWidget extends StatelessWidget {
  const SpendingsPieChartWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassEffect(
      withElevation: true,
      child: BlocBuilder<SpendingManagerBloc, SpendingManagerState>(
        builder: (context, state) {
          if (state.monthlySpendingLoading) {
            return const Loader();
          } else if (state.monthlySpending.isNotEmpty) {
            final spendingList = state.monthlySpending;
            final monthsList = spendingList.keys.toList();
            return SizedBox(
              height: 40.h,
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: spendingList.length,
                  itemBuilder: (context, index) {
                    final key = monthsList[index];
                    final item = spendingList[key];
                    DateTime? previousMonth;
                    DateTime? nextMonth;
                    if (index > 0) {
                      previousMonth = monthsList[index - 1];
                    }
                    if (index < spendingList.length - 1) {
                      nextMonth = monthsList[index + 1];
                    }

                    return ChartPageView(
                      previousMonth: previousMonth,
                      nextMonth: nextMonth,
                      spending: item ?? [],
                    );
                  }),
            );
          } else {
            return const NoDataWidget();
          }
        },
      ),
    );
  }
}

class ChartPageView extends StatelessWidget {
  const ChartPageView({
    Key? key,
    required this.spending,
    this.previousMonth,
    this.nextMonth,
  }) : super(key: key);

  final DateTime? previousMonth;
  final DateTime? nextMonth;
  final List<SpendingEntity> spending;

  @override
  Widget build(BuildContext context) {
    final chartData = spending
        .map(
          (item) => ChartData(
            name: item.name,
            percent: item.percentage,
            color: item.rgbColor,
            money: item.total,
          ),
        )
        .toList();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Offstage(
                offstage: previousMonth == null,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "<${DateFormat().add_MMM().format(previousMonth ?? DateTime.now())}",
                    style: TextManager.label1,
                  ),
                ),
              ),
              Offstage(
                offstage: nextMonth == null,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${DateFormat().add_MMM().format(nextMonth ?? DateTime.now())}>",
                    style: TextManager.label1,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25.h,
            child: SfCircularChart(
              series: <CircularSeries>[
                PieSeries<ChartData, String>(
                  dataSource: chartData,
                  pointColorMapper: (ChartData data, _) => data.color,
                  xValueMapper: (ChartData data, _) => data.name,
                  yValueMapper: (ChartData data, _) => data.percent,
                )
              ],
            ),
          ),
          _buildDescription(context, chartData),
        ],
      ),
    );
  }

  Widget _buildDescription(BuildContext context, List<ChartData> spending) {
    final List<Widget> widgets = [];
    final List<ChartData> temp = [];
    for (final item in spending) {
      temp.add(item);
      if (temp.length == 2) {
        widgets.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ChartWidget(
                chartData: temp[0],
              ),
              ChartWidget(
                chartData: temp[1],
              ),
            ],
          ),
        );
        temp.clear();
      }
    }
    if (temp.isNotEmpty) {
      widgets.add(
        Row(
          mainAxisAlignment: temp.length > 1
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.start,
          children: [
            ChartWidget(
              chartData: temp[0],
            ),
            if (temp.length > 1)
              ChartWidget(
                chartData: temp[1],
              ),
          ],
        ),
      );
    }
    return Column(
      children: widgets,
    );
  }
}

class ChartWidget extends StatelessWidget {
  const ChartWidget({
    Key? key,
    required this.chartData,
  }) : super(key: key);
  final ChartData chartData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: chartData.color,
                    ),
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                  ),
                  Text(
                    "${chartData.percent}%",
                    style: TextManager.cardLightFont.copyWith(
                      fontSize: FontSizeManager.s13,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Text(
                  "${chartData.money} SAR",
                  style: TextManager.cardDarkFont.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
