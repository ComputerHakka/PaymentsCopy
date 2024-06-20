import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:personal_payment_app/features/user_account/domain/entities/user.dart';

part 'user.g.dart';

@JsonSerializable()
@Entity(tableName: 'user', primaryKeys: ['id'])
class UserModel extends UserEntity {
  const UserModel({
    super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.password,
    super.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      password: entity.password,
      phone: entity.phone,
    );
  }
}

@JsonSerializable()
class AuthRequest {
  final String email;
  final String password;

  AuthRequest({required this.email, required this.password});

  factory AuthRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AuthRequestToJson(this);
}

@JsonSerializable()
class AuthResponse {
  @JsonKey(name: 'access_token')
  final String token;
  final UserModel user;

  AuthResponse({required this.token, required this.user});

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}

@JsonSerializable()
class ChangeContactsRequest {
  final String? phone;
  final String? email;

  ChangeContactsRequest({this.email, this.phone});

  factory ChangeContactsRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangeContactsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeContactsRequestToJson(this);
}
