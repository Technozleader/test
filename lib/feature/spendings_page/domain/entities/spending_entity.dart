import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nesma/core/common/functions/global_functions.dart';
import 'package:nesma/core/managers/mapper/mapper.dart';

class SpendingEntity extends Equatable {
  @JsonKey(name: SpendingKeys.categoryName)
  final String categoryName;
  @JsonKey(name: SpendingKeys.categoryNameAr)
  final String categoryNameAr;
  @JsonKey(name: SpendingKeys.total)
  final double total;
  @JsonKey(name: SpendingKeys.percentage)
  final double percentage;
  @JsonKey(
    name: SpendingKeys.rgbColor,
    fromJson: Mapper.toColor,
  )
  final Color rgbColor;

  String get name => isArabic()? categoryNameAr : categoryName;

  const SpendingEntity({
    required this.categoryName,
    required this.categoryNameAr,
    required this.total,
    required this.percentage,
    required this.rgbColor,
  });


  @override
  List<Object> get props => [
        categoryName,
        categoryNameAr,
        total,
        percentage,
        rgbColor,
      ];
}

class SpendingKeys {
  static const String categoryName = 'category_name';
  static const String categoryNameAr = 'category_name_ar';
  static const String total = 'total';
  static const String percentage = 'percentage';
  static const String rgbColor = 'rgb_color';
}
