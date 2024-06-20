import 'package:personal_payment_app/core/resources/data_state.dart';
import 'package:personal_payment_app/core/usecases/usecase.dart';
import 'package:personal_payment_app/features/user_account/data/models/user.dart';
import 'package:personal_payment_app/features/user_account/domain/repository/user_repository.dart';

class RegistrationUseCase implements UseCase<DataState<String>, UserModel> {
  final UserRepository _userRepository;

  RegistrationUseCase({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<DataState<String>> call({UserModel? params}) {
    return _userRepository.createUser(params!);
  }
}
