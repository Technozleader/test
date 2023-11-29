import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nesma/core/managers/string_manager/assets_manager.dart';

class Loader extends StatelessWidget {
  final double? height;
  final double? width;

  const Loader({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        AssetsManager.loading,
        height: height ?? 70,
        width: width ?? 70,
      ),
    );
  }
}
