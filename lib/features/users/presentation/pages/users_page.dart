import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silktech_users/config/themes/colors.dart';
import 'package:silktech_users/config/themes/styles.dart';
import 'package:silktech_users/features/users/presentation/bloc/users_list/users_list_bloc.dart';
import 'package:silktech_users/features/users/presentation/widgets/users_list.dart';
import 'package:silktech_users/injection_container.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<UsersListBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Users',
            style: AppStyles.headline.copyWith(
              color: AppColors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: const UsersList(),
      ),
    );
  }
}
