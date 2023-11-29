import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/managers/size_manager/corner_size.dart';

class GlassEffect extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final bool withElevation;
  final List<BoxShadow>? shadow;
  final double? borderRadius;
  final bool containWhiteBorder;
  final BorderRadius? customRadius;
  final Border? customBorder;

  const GlassEffect({
    Key? key,
    this.child,
    this.customRadius,
    this.containWhiteBorder = true,
    this.withElevation = false,
    this.width,
    this.height,
    this.shadow,
    this.borderRadius,
    this.customBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          border: customBorder ??
              (containWhiteBorder
                  ? Border.all(
                      color: ColorManager.white,
                      style: BorderStyle.solid,
                      strokeAlign:BorderSide.strokeAlignOutside
                    )
                  : null),
          color: Colors.white.withOpacity(0.2),
          borderRadius: customRadius ??
              BorderRadius.circular(borderRadius ?? CornerSize.s15),
          boxShadow: shadow ??
              [
                if (withElevation)
                  BoxShadow(
                      color: ColorManager.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 0,
                      blurStyle: BlurStyle.outer,
                      offset: const Offset(-1, 1)),
              ]),
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), child: child),
    );
  }
}
