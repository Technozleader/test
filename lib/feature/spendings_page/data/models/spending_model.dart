import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nesma/core/common/models/model_base.dart';
import 'package:nesma/core/managers/mapper/converters.dart';
import 'package:nesma/core/managers/mapper/mapper.dart';
import 'package:nesma/features/spendings_page/domain/entities/spending_entity.dart';

part 'spending_model.g.dart';

@JsonSerializable(
  checked: true,
  converters: [
    ColorModelConverter(),
  ],
)
class SpendingModel extends SpendingEntity implements Model {
  const SpendingModel({
    required super.categoryName,
    required super.categoryNameAr,
    required super.total,
    required super.percentage,
    required super.rgbColor,
  });

  factory SpendingModel.fromJson(Map<String, dynamic> json) =>
      _$SpendingModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpendingModelToJson(this);
}
