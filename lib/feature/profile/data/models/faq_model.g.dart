// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FAQModel _$FAQModelFromJson(Map<String, dynamic> json) => FAQModel(
      faqId: json['faq_id'] as int,
      questionEn: json['question'] as String,
      answerEn: json['answer'] as String,
      questionAr: json['question_ar'] as String,
      answerAr: json['answer_ar'] as String,
      group: json['group'] as String,
      number: json['number'] as int,
    );

Map<String, dynamic> _$FAQModelToJson(FAQModel instance) => <String, dynamic>{
      'faq_id': instance.faqId,
      'question': instance.questionEn,
      'answer': instance.answerEn,
      'question_ar': instance.questionAr,
      'answer_ar': instance.answerAr,
      'group': instance.group,
      'number': instance.number,
    };
