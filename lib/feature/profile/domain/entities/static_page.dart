import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nesma/core/common/functions/global_functions.dart';

class StaticPageEntity extends Equatable {
  @JsonKey(name: StaticPageKeys.title)
  final String titleEn;
  @JsonKey(name: StaticPageKeys.titleAr)
  final String titleAr;
  @JsonKey(name: StaticPageKeys.content)
  final String contentEn;
  @JsonKey(name: StaticPageKeys.contentAr)
  final String contentAr;

  String get title => isArabic()? titleAr : titleEn;
  String get content => isArabic()? contentAr : contentEn;

  const StaticPageEntity({
    required this.titleEn,
    required this.titleAr,
    required this.contentEn,
    required this.contentAr,
  });

  @override
  List<Object?> get props => [
        titleEn,
        titleAr,
        contentEn,
        contentAr,
      ];
}



class StaticPageKeys {
  static const String title = "title";
  static const String titleAr = "title_ar";
  static const String content = "content";
  static const String contentAr = "content_ar";
}
