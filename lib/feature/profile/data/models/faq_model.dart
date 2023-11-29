import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nesma/core/common/models/model_base.dart';
import 'package:nesma/features/profile/domain/entities/faq_entity.dart';

part 'faq_model.g.dart';

@JsonSerializable()
class FAQModel extends FAQEntity implements Model {
  const FAQModel({
    required super.faqId,
    required super.questionEn,
    required super.answerEn,
    required super.questionAr,
    required super.answerAr,
    required super.group,
    required super.number,
  });

  factory FAQModel.fromJson(Map<String, dynamic> json) =>
      _$FAQModelFromJson(json);

  Map<String, dynamic> toJson() => _$FAQModelToJson(this);
}
