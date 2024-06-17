import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:personal_payment_app/features/authorization/data/data_sources/remote/auth_api_service.dart';
import 'package:personal_payment_app/features/authorization/data/repository/user_repository_impl.dart';
import 'package:personal_payment_app/features/authorization/domain/repository/user_repository.dart';
import 'package:personal_payment_app/features/authorization/domain/usecases/login.dart';
import 'package:personal_payment_app/features/authorization/presentation/bloc/auth/remote/remote_auth_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final container = GetIt.instance;

Future<void> initializeDependencies() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  container.registerSingleton<SharedPreferences>(prefs);

  container.registerSingleton<Dio>(Dio());

  container.registerSingleton<AuthApiService>(AuthApiService(container()));

  container.registerSingleton<UserRepository>(UserRepositoryImpl(container()));

  container.registerSingleton<LoginUseCase>(
      LoginUseCase(userRepository: container()));

  container.registerFactory<RemoteAuthBloc>(() => RemoteAuthBloc(container()));
}
