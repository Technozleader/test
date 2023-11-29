import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';

class ResendCounter extends StatefulWidget {
  final VoidCallback? afterDuration;

  const ResendCounter({Key? key, this.afterDuration}) : super(key: key);

  @override
  _ResendCounterState createState() => _ResendCounterState();
}

class _ResendCounterState extends State<ResendCounter> {
  int _counter = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(_counter > 0) {
        setState(() {
        _counter--;
      });
      }else {
        _timer?.cancel();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "${'resend_new_code_in'.tr} $_counter  ${'seconds'.tr}",
        style: TextManager.cardLightFont.copyWith(
          color: ColorManager.black,
        ),
      ),
    );
  }
}
