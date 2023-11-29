import 'package:flutter/material.dart';
import 'package:nesma/core/common/widgets/glass_effect_widget.dart';
import 'package:nesma/core/managers/size_manager/font_size_manager.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:nesma/features/spendings_page/presentation/page/spendings_page.dart';

class ChartItemDetailsWidget extends StatelessWidget {
  const ChartItemDetailsWidget({
    Key? key,
    required this.chartData,
  }) : super(key: key);
  final ChartData chartData;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: GlassEffect(
        withElevation: true,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: chartData.color),
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chartData.name,
                        style: TextManager.cardDarkFont.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        "${chartData.percent}%",
                        style: TextManager.cardLightFont.copyWith(
                          fontSize: FontSizeManager.s13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                "${chartData.percent}\nSAR",
                style: TextManager.cardDarkFont.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
