import 'dart:async';

import 'package:silktech_users/core/resources/data_state.dart';
import 'package:silktech_users/core/usecase/usecase.dart';
import 'package:silktech_users/features/users/domain/entities/user.dart';
import 'package:silktech_users/features/users/domain/repositories/users_repository.dart';

class GetUserUseCase implements UseCase<DataState<User>, int> {
  final UsersRepository usersRepository;

  GetUserUseCase({required this.usersRepository});

  @override
  Future<DataState<User>> call({params}) {
    return usersRepository.getUserDetails(params!);
  }
}
