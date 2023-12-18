import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:silktech_users/core/network/settings.dart';
import 'package:silktech_users/features/users/data/datasources/remote/users_api_service.dart';
import 'package:silktech_users/features/users/data/repositories/users_repository_impl.dart';
import 'package:silktech_users/features/users/domain/repositories/users_repository.dart';
import 'package:silktech_users/features/users/domain/usecases/get_user_usecase.dart';
import 'package:silktech_users/features/users/domain/usecases/get_users_list_usecase.dart';
import 'package:silktech_users/features/users/presentation/bloc/cubit/buttons_cubit.dart';
import 'package:silktech_users/features/users/presentation/bloc/user/user_bloc.dart';
import 'package:silktech_users/features/users/presentation/bloc/users_list/users_list_bloc.dart';

final GetIt getIt = GetIt.instance;

Future setupDependencies() async {
  Dio dio = apiDioFactory();

  final UsersApiService usersApiService = UsersApiService(dio);

  final UsersRepository usersRepository =
      UsersRepositoryImpl(service: usersApiService);

  final GetUsersListUseCase getUsersListUseCase = GetUsersListUseCase(
    usersRepository: usersRepository,
  );

  final GetUserUseCase getUserUseCase = GetUserUseCase(
    usersRepository: usersRepository,
  );

  getIt.registerLazySingleton<UsersListBloc>(
    () => UsersListBloc(
      getUsersListUseCase,
    ),
  );

  getIt.registerLazySingleton<UserBloc>(
    () => UserBloc(
      getUserUseCase,
    ),
  );

  getIt.registerLazySingleton<ButtonsCubit>(
    () => ButtonsCubit(),
  );
}
