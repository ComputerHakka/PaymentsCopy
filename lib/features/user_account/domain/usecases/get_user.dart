import 'package:personal_payment_app/core/usecases/usecase.dart';
import 'package:personal_payment_app/features/user_account/domain/entities/user.dart';
import 'package:personal_payment_app/features/user_account/domain/repository/user_repository.dart';

class GetUserUseCase implements UseCase<UserEntity?, void> {
  final UserRepository _userRepository;

  GetUserUseCase(this._userRepository);

  @override
  Future<UserEntity?> call({void params}) {
    return _userRepository.getUser();
  }
}
