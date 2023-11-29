import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nesma/core/managers/string_manager/assets_manager.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        AssetsManager.noDataAnimation,
        height: 200,
      ),
    );
  }
}
