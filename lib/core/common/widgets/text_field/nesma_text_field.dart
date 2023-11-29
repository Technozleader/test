import 'package:flutter/material.dart';
import 'package:nesma/core/common/widgets/glass_effect_widget.dart';
import 'package:nesma/core/extension/context_extension.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/managers/size_manager/corner_size.dart';
import 'package:nesma/core/managers/size_manager/font_size_manager.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';

class NesmaTextField extends StatelessWidget {
  final String? hintText;
  final double width;
  final String? initialValue;
  final void Function(String value)? onChanged;
  const NesmaTextField({
    Key? key,
    this.hintText,
    required this.width,
    this.initialValue,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35.5, vertical: 10),
      child: GlassEffect(
        height: context.height * 0.05,
        width: width,
        withElevation: true,
        child: TextFormField(
          onChanged: onChanged,
          initialValue: initialValue,
          autofocus: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(CornerSize.s15),
                borderSide: const BorderSide(color: ColorManager.white)),
            fillColor: Colors.transparent,
            alignLabelWithHint: true,
            hintStyle: TextManager.cardTitle.copyWith(
              color: ColorManager.grey,
              fontSize: FontSizeManager.s15,
            ),
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: ColorManager.white),
                borderRadius: BorderRadius.circular(CornerSize.s15)),
          ),
        ),
      ),
    );
  }
}
