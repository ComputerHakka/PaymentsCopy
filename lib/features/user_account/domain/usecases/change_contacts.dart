import 'package:personal_payment_app/core/resources/data_state.dart';
import 'package:personal_payment_app/core/usecases/usecase.dart';
import 'package:personal_payment_app/features/user_account/data/models/user.dart';
import 'package:personal_payment_app/features/user_account/domain/repository/user_repository.dart';

class ChangeContactsUseCase
    implements UseCase<DataState<String>, ChangeContactsRequest> {
  final UserRepository _userRepository;

  ChangeContactsUseCase({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<DataState<String>> call({ChangeContactsRequest? params}) {
    return _userRepository.changeContacts(2, params!);
  }
}
