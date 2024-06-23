import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class UserEntity extends Equatable {
  final int? id;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String email;
  final String password;
  final String? phone;

  const UserEntity(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      this.id,
      this.phone});

  @override
  List<Object?> get props => [id, firstName, lastName, email, password, phone];

  UserEntity copyWith(
      {int? id,
      String? firstName,
      String? lastName,
      String? email,
      String? password,
      String? phone}) {
    return UserEntity(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        password: password ?? this.password,
        phone: phone ?? this.phone);
  }
}
