// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'static_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaticPageModel _$StaticPageModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'StaticPageModel',
      json,
      ($checkedConvert) {
        final val = StaticPageModel(
          titleEn: $checkedConvert('title', (v) => v as String),
          titleAr: $checkedConvert('title_ar', (v) => v as String),
          contentEn: $checkedConvert('content', (v) => v as String),
          contentAr: $checkedConvert('content_ar', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'titleEn': 'title',
        'titleAr': 'title_ar',
        'contentEn': 'content',
        'contentAr': 'content_ar'
      },
    );

Map<String, dynamic> _$StaticPageModelToJson(StaticPageModel instance) =>
    <String, dynamic>{
      'title': instance.titleEn,
      'title_ar': instance.titleAr,
      'content': instance.contentEn,
      'content_ar': instance.contentAr,
    };
