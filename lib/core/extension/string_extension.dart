import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:nesma/core/common/bloc/app_manager_cubit.dart';
import 'package:nesma/core/localization/app_localization.dart';
import 'package:nesma/core/managers/string_manager/assets_manager.dart';
import 'package:nesma/core/service_locator.dart';

extension ImageExtracterExtension on String {
  Widget toImage({
    double? width,
    double? height,
    BoxFit? fit,
  }) {
    if (isEmpty) {
      return Image.asset(
        AssetsManager.placeHolder,
        fit: fit,
        width: width,
        height: height,
      );
    } else {
      return CachedNetworkImage(
        imageUrl: this,
        fit: fit,
        width: width,
        height: height,
        errorWidget: (context, object, stackTrace) => Image.asset(
          AssetsManager.placeHolder,
          fit: fit,
          width: width,
          height: height,
        ),
      );
    }
  }

  DecorationImage toDecorationImage({
    double? width,
    double? height,
    BoxFit? fit,
  }) {
    if (isEmpty) {
      return DecorationImage(
        image: const AssetImage(
          AssetsManager.placeHolder,
        ),
        fit: fit,
      );
    } else {
      return DecorationImage(
        image: CachedNetworkImageProvider(this),
        fit: fit,
      );
    }
  }

  ImageProvider toImageProvider() {
    if (isEmpty) {
      return const AssetImage(AssetsManager.placeHolder);
    } else {
      return NetworkImage(this);
    }
  }

  String get tr {
    final language = getIt<AppManagerCubit>().locale.languageCode;
    return translateMap[this]?[language] ?? '';
  }
}
