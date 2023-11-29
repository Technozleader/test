import 'package:nesma/core/common/entities/user/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nesma/core/common/models/model_base.dart';


part 'user_model.g.dart';

@JsonSerializable(
  checked: true,
)
class UserModel extends UserEntity implements Model {
  const UserModel({
    required super.id,
    required super.name,
    required super.lastName,
    required super.phone,
    required super.profileImage,
    required super.token,
    required super.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
