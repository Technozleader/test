import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nesma/core/common/bloc/app_manager_cubit.dart';
import 'package:nesma/core/common/dialog/show_dialog.dart';
import 'package:nesma/core/managers/string_manager/assets_manager.dart';
import 'package:nesma/core/service_locator.dart';
import 'package:url_launcher/url_launcher.dart';

bool isArabic() {
  return getIt<AppManagerCubit>().locale.languageCode == 'ar';
}

Future<void> openLink(BuildContext context, String url) async {
  try {
    if (url.isEmpty) {
      return;
    }
    await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.inAppWebView,
    );
  } on Exception catch (_) {
    showAppDialog(
      context,
      lottieAnimationWidget: Lottie.asset(
        AssetsManager.error,
        width: 40,
      ),
      message: 'Could not launch $url',
    );
  } catch (e) {
    showAppDialog(
      context,
      lottieAnimationWidget: Lottie.asset(
        AssetsManager.error,
        width: 40,
      ),
      message: 'Could not launch $url',
    );
  }
}
