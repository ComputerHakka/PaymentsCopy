import 'package:json_annotation/json_annotation.dart';
import 'package:personal_payment_app/features/user_account/domain/entities/user.dart';

part 'user.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  @override
  @JsonKey(name: 'first_name')
  final String firstName;

  @override
  @JsonKey(name: 'last_name')
  final String lastName;

  const UserModel({
    super.id,
    required this.firstName,
    required this.lastName,
    required super.email,
    required super.password,
    super.phone,
  }) : super(firstName: firstName, lastName: lastName);

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
