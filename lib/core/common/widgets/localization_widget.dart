import 'package:flutter/material.dart';
import 'package:nesma/core/common/bloc/app_manager_cubit.dart';
import 'package:nesma/core/common/functions/global_functions.dart';
import 'package:nesma/core/common/widgets/glass_effect_widget.dart';
import 'package:nesma/core/extension/context_extension.dart';
import 'package:nesma/core/localization/app_localization.dart';
import 'package:nesma/core/managers/size_manager/corner_size.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:nesma/core/service_locator.dart';

class LocalizationWidget extends StatefulWidget {
  const LocalizationWidget({Key? key}) : super(key: key);

  @override
  State<LocalizationWidget> createState() => _LocalizationWidgetState();
}

class _LocalizationWidgetState extends State<LocalizationWidget> {
  @override
  Widget build(BuildContext context) {
    final manager = getIt<AppManagerCubit>();
    final languages = AppLocalization.languages()
      ..remove(
        manager.locale.languageCode,
      );
    return InkWell(
      onTap: () {
        showMenu(
          context: context,
          constraints: BoxConstraints(
            maxWidth: context.width * 0.3,
          ),
          color: Colors.transparent,
          elevation: 0,
          position: RelativeRect.fromLTRB(
            isArabic() ? context.width * 0.1 : context.width * 0.7,
            context.width * 0.2,
            isArabic() ? context.width * 0.7 : context.width * 0.1,
            0,
          ),
          items: languages
              .map(
                (e) => PopupMenuItem(
                  padding: EdgeInsets.zero,
                  height: context.width * 0.1,
                  onTap: () {
                    manager.changeLocale(e);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 0.6),
                      borderRadius: BorderRadius.circular(CornerSize.s5),
                    ),
                    child: GlassEffect(
                      borderRadius: CornerSize.s5,
                      width: context.width * 0.3,
                      height: context.width * 0.1,
                      withElevation: false,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          e.toUpperCase(),
                          style: TextManager.cardDarkFont,
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 0.6),
          borderRadius: BorderRadius.circular(CornerSize.s5),
        ),
        child: GlassEffect(
          borderRadius: CornerSize.s5,
          width: context.width * 0.1,
          height: context.width * 0.1,
          withElevation: true,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              manager.locale.languageCode.toUpperCase(),
              style: TextManager.cardDarkFont,
            ),
          ),
        ),
      ),
    );
  }
}
