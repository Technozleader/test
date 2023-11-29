import 'package:flutter/material.dart';
import 'package:nesma/core/common/widgets/glass_effect_widget.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:sizer/sizer.dart';

class CustomExpansionContainer extends StatefulWidget {
  const CustomExpansionContainer({
    Key? key,
    required this.header,
    required this.answer,
  }) : super(key: key);
  final String header;
  final String answer;

  @override
  State<CustomExpansionContainer> createState() =>
      _CustomExpansionContainerState();
}

class _CustomExpansionContainerState extends State<CustomExpansionContainer> {
  bool open = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: GlassEffect(
        withElevation: true,
        child: ExpansionPanelList(
          expandedHeaderPadding: EdgeInsets.zero,
          expansionCallback: (panelIndex, isExpanded) => setState(() {
            open = !open;
          }),
          elevation: 0,
          dividerColor: Colors.red,
          children: [
            ExpansionPanel(
              backgroundColor: Colors.transparent,
              headerBuilder: (context, isExpanded) => Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 3.h,
                ),
                child: Text(
                  widget.header,
                  style: TextManager.label1,
                ),
              ),
              body: Column(
                children: [
                  Container(
                    height: 2,
                    width: double.infinity,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 8, bottom: 5.h, top: 8),
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.answer,
                      style:
                          TextManager.label1.copyWith(color: ColorManager.grey),
                    ),
                  ),
                ],
              ),
              isExpanded: open,
            ),
          ],
        ),
      ),
    );
  }
}
