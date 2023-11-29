import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesma/core/common/functions/global_functions.dart';
import 'package:nesma/core/common/widgets/glass_effect_widget.dart';
import 'package:nesma/core/extension/context_extension.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/managers/icons_manager/icons_manager.dart';
import 'package:nesma/core/managers/size_manager/corner_size.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:nesma/features/home/domain/entities/soter_in_category.dart';
import 'package:nesma/features/home/presentation/managers/home_bloc/home_bloc.dart';

class StoreWidget extends StatelessWidget {
  const StoreWidget({
    Key? key,
    required this.cardPadding,
    required this.store,
  }) : super(key: key);

  final double cardPadding;
  final StoreInCategoryEntity store;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await openLink(
          context,
          store.storeUrl,
        );
      },
      child: Padding(
        padding: EdgeInsets.only(
            left: 15.0, bottom: cardPadding, top: cardPadding, right: 15.0),
        child: GlassEffect(
          withElevation: true,
          width: context.width * 0.6,
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: context.width * 0.6,
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(CornerSize.s15),
                          topRight: Radius.circular(CornerSize.s15)),
                      child: store.image.toImage(
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, top: 5, bottom: 5, right: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: CornerSize.s15,
                      backgroundColor: ColorManager.active,
                      backgroundImage: store.logo.toImageProvider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        store.name,
                        style: TextManager.bodyText1.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<HomeBloc>(context)
                            .add(const HomeEvent.switchFavorite(1));
                      },
                      child: const Icon(
                        IconsManager.heartEmpty,
                        color: ColorManager.red,
                        size: 18,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
