import 'package:flutter/material.dart';
import 'package:nesma/core/common/widgets/glass_effect_widget.dart';
import 'package:nesma/core/extension/context_extension.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/managers/size_manager/corner_size.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';

class SearchField extends StatelessWidget {
  final String? hintText;

  const SearchField({Key? key, this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.5, vertical: 15),
      child: GlassEffect(
        height: context.height * 0.05,
        withElevation: true,
        child: TextFormField(
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(CornerSize.s15),
                  borderSide: const BorderSide(color: ColorManager.white)),
              fillColor: Colors.transparent,
              filled: true,
              hintText: hintText,
              hintStyle: TextManager.label2,
              prefixIcon: const Icon(Icons.search),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: ColorManager.white),
                  borderRadius: BorderRadius.circular(CornerSize.s15))),
        ),
      ),
    );
  }
}
