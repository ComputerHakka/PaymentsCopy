import 'package:personal_payment_app/core/resources/data_state.dart';
import 'package:personal_payment_app/features/authorization/data/models/user.dart';
import 'package:personal_payment_app/features/authorization/domain/entities/user.dart';

abstract class UserRepository {
  Future<DataState<UserEntity>> login(AuthRequest request);
}
