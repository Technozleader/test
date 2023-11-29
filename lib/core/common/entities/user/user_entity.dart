import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class UserEntity extends Equatable {
  @JsonKey(name: UserEntityKeys.id)
  final int id;
  @JsonKey(name: UserEntityKeys.name)
  final String name;
  @JsonKey(name: UserEntityKeys.lastName)
  final String lastName;
  @JsonKey(name: UserEntityKeys.phone)
  final String phone;
  @JsonKey(name: UserEntityKeys.profileImage,includeIfNull: true,defaultValue: '')
  final String profileImage;
  @JsonKey(name: UserEntityKeys.token)
  final String token;
  @JsonKey(name: UserEntityKeys.email)
  final String email;

  @override
  List<Object> get props => [
        id,
        name,
        lastName,
        phone,
        profileImage,
        token,
      ];

  const UserEntity({
    required this.id,
    required this.name,
    required this.lastName,
    required this.phone,
    required this.profileImage,
    required this.token,
    required this.email,
  });

  UserEntity copyWith({
    int? id,
    String? name,
    String? lastName,
    String? phone,
    String? profileImage,
    String? token,
    String? email,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      profileImage: profileImage ?? this.profileImage,
      token: token ?? this.token,
      email: email ?? this.email,
    );
  }
}

class UserEntityKeys {
  static const String id = 'id';
  static const String name = 'name';
  static const String lastName = 'last_name';
  static const String phone = 'phone';
  static const String profileImage = 'profile_image';
  static const String token = 'access_token';
  static const String email = 'email';
}
