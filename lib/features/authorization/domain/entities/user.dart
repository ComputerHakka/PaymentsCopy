import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String? phone;

  const UserEntity({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    this.phone,
  });

  @override
  List<Object?> get props => [id, firstName, lastName, email, password, phone];
}
