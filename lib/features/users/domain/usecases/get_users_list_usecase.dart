import 'dart:async';

import 'package:silktech_users/core/resources/data_state.dart';
import 'package:silktech_users/core/usecase/usecase.dart';
import 'package:silktech_users/features/users/domain/entities/users_list.dart';
import 'package:silktech_users/features/users/domain/repositories/users_repository.dart';

class GetUsersListUseCase
    implements UseCase<DataState<UsersList>, GetUsersListUseCaseParams> {
  final UsersRepository usersRepository;

  GetUsersListUseCase({required this.usersRepository});

  @override
  Future<DataState<UsersList>> call({params}) {
    return usersRepository.getUsers(params!.page, params.perPage);
  }
}

class GetUsersListUseCaseParams {
  final int page;
  final int perPage;
  GetUsersListUseCaseParams({
    required this.page,
    required this.perPage,
  });
}
