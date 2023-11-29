import 'package:flutter/material.dart';
import 'package:nesma/core/extension/context_extension.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/managers/size_manager/font_size_manager.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:sizer/sizer.dart';

class NesmaAppbar extends StatelessWidget implements PreferredSizeWidget {
  const NesmaAppbar({
    Key? key,
    required this.pageName,
    this.actions
  }) : super(key: key);
  final String pageName;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
          color: ColorManager.black,
        ),
      ),
      elevation: 0,
      leadingWidth: context.width * 0.2,
      backgroundColor: Colors.transparent,
      title: Text(
        pageName,
        style: TextManager.headline1.copyWith(
          fontSize: FontSizeManager.s18,
        ),
      ),
    actions:actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(100.w, 7.h);
}
