import 'package:flutter/material.dart';
import 'package:nesma/core/common/widgets/glass_effect_widget.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/managers/size_manager/corner_size.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:sizer/sizer.dart';

class OptionWidget extends StatelessWidget {
  const OptionWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final Widget icon;
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Padding(padding: const EdgeInsets.all(8), child: icon),
          Text(text, style: TextManager.label1)
        ],
      ),
    );
  }
}

class ProfileWidgetsContainer extends StatelessWidget {
  const ProfileWidgetsContainer({
    Key? key,
    required this.containerChild,
  }) : super(key: key);
  final List<Widget> containerChild;
  @override
  Widget build(BuildContext context) {
    return GlassEffect(
      withElevation: true,
      borderRadius: CornerSize.s20,
      width: 100.w,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => containerChild[index],
          itemCount: containerChild.length,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => Divider(
            indent: 10.w,
            endIndent: 10.w,
            thickness: 2,
            color: ColorManager.grey.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
