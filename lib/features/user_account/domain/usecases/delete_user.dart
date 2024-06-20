import 'package:personal_payment_app/core/usecases/usecase.dart';
import 'package:personal_payment_app/features/user_account/domain/entities/user.dart';
import 'package:personal_payment_app/features/user_account/domain/repository/user_repository.dart';

class DeleteUserUseCase implements UseCase<void, UserEntity> {
  final UserRepository _userRepository;

  DeleteUserUseCase(this._userRepository);

  @override
  Future<void> call({UserEntity? params}) {
    return _userRepository.logout(params!);
  }
}
