import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nesma/core/common/models/model_base.dart';
import 'package:nesma/features/profile/domain/entities/static_page.dart';

part 'static_page_model.g.dart';

@JsonSerializable(
  checked: true,
)
class StaticPageModel extends StaticPageEntity implements Model {
  const StaticPageModel({
    required super.titleEn,
    required super.titleAr,
    required super.contentEn,
    required super.contentAr,
  });

  factory StaticPageModel.fromJson(Map<String, dynamic> json) =>
      _$StaticPageModelFromJson(json);

  Map<String, dynamic> toJson() => _$StaticPageModelToJson(this);
}
