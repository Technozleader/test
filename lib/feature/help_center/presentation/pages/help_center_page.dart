import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesma/core/common/bloc/app_manager_cubit.dart';
import 'package:nesma/core/common/widgets/app_bar/nesma_app_bar.dart';
import 'package:nesma/core/common/widgets/background_widget.dart';
import 'package:nesma/core/common/widgets/glass_effect_widget.dart';
import 'package:nesma/core/extension/context_extension.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/managers/routes/routes.dart';
import 'package:nesma/core/managers/size_manager/corner_size.dart';
import 'package:nesma/core/managers/size_manager/font_size_manager.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:nesma/features/help_center/presentation/mock/help_options.dart';
import 'package:sizer/sizer.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppManagerCubit, AppManagerState>(
        builder: (context, state) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: NesmaAppbar(
          pageName: "help_center".tr,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GlassEffect(
                width: 50,
                height: 50,
                borderRadius: 10,
                withElevation: true,
                child: IconButton(
                    onPressed: () {
                      context.pushNamed(Routes.tickets);
                    },
                    icon: const Icon(
                      Icons.history,
                      size: 28,
                    )),
              ),
            ),
          ],
        ),
        body: BackgroundWidget(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  "how_can_we_help_you".tr,
                  style: TextManager.headline1.copyWith(
                    fontSize: FontSizeManager.s18,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Wrap(
                  children: List.generate(
                    options.length,
                    (index) => InkWell(
                      onTap: () {
                        context.pushNamed(Routes.chat);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GlassEffect(
                          borderRadius: CornerSize.s13,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              options[index].option.tr,
                              style: TextManager.label1.copyWith(
                                fontWeight: FontWeight.w100,
                                letterSpacing: 0.02,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
