import 'package:personal_payment_app/core/resources/data_state.dart';
import 'package:personal_payment_app/core/usecases/usecase.dart';
import 'package:personal_payment_app/features/authorization/data/models/user.dart';
import 'package:personal_payment_app/features/authorization/domain/entities/user.dart';
import 'package:personal_payment_app/features/authorization/domain/repository/user_repository.dart';

class LoginUseCase implements UseCase<DataState<UserEntity>, AuthRequest> {
  final UserRepository _userRepository;

  LoginUseCase({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<DataState<UserEntity>> call({AuthRequest? params}) {
    return _userRepository.login(params!);
  }
}
