import 'package:flutter/material.dart';
import 'package:nesma/core/common/widgets/glass_effect_widget.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:sizer/sizer.dart';

class PrivacyPolicyContainer extends StatelessWidget {
  const PrivacyPolicyContainer({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.h),
      child: GlassEffect(
        withElevation: true,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextManager.label1,
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  subtitle,
                  style: TextManager.label2.copyWith(color: ColorManager.grey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
