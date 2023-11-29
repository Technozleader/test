import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nesma/core/common/functions/global_functions.dart';

class FAQEntity extends Equatable {
  @JsonKey(name: FAQKeys.faqId)
  final int faqId;
  @JsonKey(name: FAQKeys.question)
  final String questionEn;
  @JsonKey(name: FAQKeys.answer)
  final String answerEn;
  @JsonKey(name: FAQKeys.questionAr)
  final String questionAr;
  @JsonKey(name: FAQKeys.answerAr)
  final String answerAr;
  @JsonKey(name: FAQKeys.group)
  final String group;
  @JsonKey(name: FAQKeys.number)
  final int number;

  const FAQEntity({
    required this.faqId,
    required this.questionEn,
    required this.answerEn,
    required this.questionAr,
    required this.answerAr,
    required this.group,
    required this.number,
  });


  String get question => isArabic()? questionAr : questionEn;
  String get answer => isArabic()? answerAr : answerEn;


  @override
  List<Object> get props => [
        faqId,
        questionEn,
        answerEn,
        questionAr,
        answerAr,
        group,
        number,
      ];
}
class FAQKeys{
  static const String faqId = 'faq_id';
  static const String question = 'question';
  static const String answer = 'answer';
  static const String questionAr = 'question_ar';
  static const String answerAr = 'answer_ar';
  static const String group = 'group';
  static const String number = 'number';
}