import 'package:flutter/material.dart';
import 'package:nesma/core/common/widgets/glass_effect_widget.dart';
import 'package:nesma/core/extension/context_extension.dart';
import 'package:nesma/core/extension/formatter.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:nesma/features/notification/presentation/mock/notificatinos.dart';

class NotificationComponent extends StatelessWidget {
  final NotificationMockModel notificationMockModel;

  const NotificationComponent({
    Key? key,
    required this.notificationMockModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 24,
      ),
      child: GlassEffect(
        withElevation: true,
        width: context.width * 0.9,
        borderRadius: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 13,
                top: 6,
              ),
              child: Text(
                notificationMockModel.date.formatToMDYYYYY,
                style: TextManager.accountSubtitle.copyWith(
                  color: ColorManager.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const Divider(
              color: ColorManager.grey4,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 13,
                top: 3,
                bottom: 3
              ),
              child: Text(
                notificationMockModel.content,
                style: TextManager.bodyText1.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
