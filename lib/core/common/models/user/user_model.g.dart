// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'UserModel',
      json,
      ($checkedConvert) {
        final val = UserModel(
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
          lastName: $checkedConvert('last_name', (v) => v as String),
          phone: $checkedConvert('phone', (v) => v as String),
          profileImage:
              $checkedConvert('profile_image', (v) => v as String? ?? ''),
          token: $checkedConvert('access_token', (v) => v as String),
          email: $checkedConvert('email', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'lastName': 'last_name',
        'profileImage': 'profile_image',
        'token': 'access_token'
      },
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'last_name': instance.lastName,
      'phone': instance.phone,
      'profile_image': instance.profileImage,
      'access_token': instance.token,
      'email': instance.email,
    };
