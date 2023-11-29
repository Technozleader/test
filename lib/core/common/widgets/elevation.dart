import 'package:flutter/material.dart';

import '../../managers/colors/color_manager.dart';

class Elevation extends StatelessWidget {
  final Widget child;
  final double radius;
  final Clip? clipBehavior;

  const Elevation({
    Key? key,
    required this.child,
    this.radius = 0,
    this.clipBehavior,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: clipBehavior??Clip.none,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
                color: ColorManager.grey.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 3,
                offset: const Offset(-6, 6))
          ]),
      child: child,
    );
  }
}
