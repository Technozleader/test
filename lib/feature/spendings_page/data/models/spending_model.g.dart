// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spending_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpendingModel _$SpendingModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SpendingModel',
      json,
      ($checkedConvert) {
        final val = SpendingModel(
          categoryName: $checkedConvert('category_name', (v) => v as String),
          categoryNameAr:
              $checkedConvert('category_name_ar', (v) => v as String),
          total: $checkedConvert('total', (v) => (v as num).toDouble()),
          percentage:
              $checkedConvert('percentage', (v) => (v as num).toDouble()),
          rgbColor: $checkedConvert('rgb_color', (v) => Mapper.toColor(v)),
        );
        return val;
      },
      fieldKeyMap: const {
        'categoryName': 'category_name',
        'categoryNameAr': 'category_name_ar',
        'rgbColor': 'rgb_color'
      },
    );

Map<String, dynamic> _$SpendingModelToJson(SpendingModel instance) =>
    <String, dynamic>{
      'category_name': instance.categoryName,
      'category_name_ar': instance.categoryNameAr,
      'total': instance.total,
      'percentage': instance.percentage,
      'rgb_color': const ColorModelConverter().toJson(instance.rgbColor),
    };
