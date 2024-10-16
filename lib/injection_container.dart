import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:personal_payment_app/core/util/theme/theme_cubit.dart';
import 'package:personal_payment_app/features/data_storage/data/local/app_database.dart';
import 'package:personal_payment_app/features/user_account/data/data_sources/remote/auth_api_service.dart';
import 'package:personal_payment_app/features/user_account/data/repository/user_repository_impl.dart';
import 'package:personal_payment_app/features/user_account/domain/repository/user_repository.dart';
import 'package:personal_payment_app/features/user_account/domain/usecases/change_contacts.dart';
import 'package:personal_payment_app/features/user_account/domain/usecases/delete_user.dart';
import 'package:personal_payment_app/features/user_account/domain/usecases/get_user.dart';
import 'package:personal_payment_app/features/user_account/domain/usecases/login.dart';
import 'package:personal_payment_app/features/user_account/domain/usecases/registration.dart';
import 'package:personal_payment_app/features/user_account/domain/usecases/save_user.dart';
import 'package:personal_payment_app/features/user_account/domain/usecases/update_user.dart';
import 'package:personal_payment_app/features/user_account/presentation/authorization/presentation/bloc/auth/remote/remote_auth_bloc.dart';
import 'package:personal_payment_app/features/history/presentation/bloc/filter/filter_transactions_bloc.dart';
import 'package:personal_payment_app/features/support/presentation/bloc/bloc/messages_bloc.dart';
import 'package:personal_payment_app/features/user_account/presentation/bloc/local/user_database_bloc.dart';
import 'package:personal_payment_app/features/user_account/presentation/profile/bloc/bloc/change_contacts_bloc.dart';
import 'package:personal_payment_app/features/user_account/presentation/registration/presentation/bloc/remote/remote_registration_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final container = GetIt.instance;

final dioOptions = BaseOptions(
  connectTimeout: const Duration(seconds: 50),
  receiveTimeout: const Duration(minutes: 1),
);

Future<void> initializeDependencies() async {
  final dataBase =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  container.registerSingleton<AppDatabase>(dataBase);

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  container.registerSingleton<SharedPreferences>(prefs);

  container.registerSingleton<Dio>(Dio(dioOptions));

  container.registerSingleton<AuthApiService>(AuthApiService(container()));

  container.registerSingleton<UserRepository>(
      UserRepositoryImpl(container(), container()));

  container.registerSingleton<LoginUseCase>(
      LoginUseCase(userRepository: container()));

  container.registerSingleton<RegistrationUseCase>(
      RegistrationUseCase(userRepository: container()));

  container.registerSingleton<ChangeContactsUseCase>(
      ChangeContactsUseCase(userRepository: container()));

  container.registerSingleton<GetUserUseCase>(GetUserUseCase(container()));

  container.registerSingleton<SaveUserUseCase>(SaveUserUseCase(container()));

  container
      .registerSingleton<DeleteUserUseCase>(DeleteUserUseCase(container()));

  container.registerSingleton<UpdateUserLocalUseCase>(
      UpdateUserLocalUseCase(container()));

  container.registerFactory<RemoteAuthBloc>(() => RemoteAuthBloc(container()));

  container.registerFactory<RemoteRegistrationBloc>(
      () => RemoteRegistrationBloc(container()));

  container.registerFactory<UserDatabaseBloc>(() =>
      UserDatabaseBloc(container(), container(), container(), container()));

  container.registerFactory<ChangeContactsBloc>(
      () => ChangeContactsBloc(container()));

  container
      .registerFactory<FilterTransactionsBloc>(() => FilterTransactionsBloc());

  container.registerFactory<MessagesBloc>(() => MessagesBloc());

  container.registerFactory<ThemeCubit>(() => ThemeCubit(container()));
}
