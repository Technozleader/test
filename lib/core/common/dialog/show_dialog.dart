import 'package:flutter/material.dart';
import 'package:nesma/core/common/dialog/app_dialog.dart';

Future<T?> showAppDialog<T>(
  BuildContext context, {
  Key? key,
  Widget? lottieAnimationWidget,
  String? title,
  String? message,
  String? buttonText,
  VoidCallback? buttonAction,
  bool dismissible = true,
}) async {
  return await showGeneralDialog<T>(
    context: context,
    barrierDismissible: dismissible,
    barrierLabel:'Alert Dialog' ,
    pageBuilder: (context, animation, secondaryAnimation) {
      return ScaleTransition(
        scale: animation,
        child: Dialog(
          insetPadding: const EdgeInsets.symmetric(vertical:25 ),
          backgroundColor: Colors.transparent,
          child: AppDialog(
            key: key,
            lottieAnimationPath: lottieAnimationWidget,
            title: title,
            message: message,
            buttonText: buttonText,
          ),
        ),
      );
    },
  );
}
