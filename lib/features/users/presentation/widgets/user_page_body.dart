import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silktech_users/features/users/domain/entities/user.dart';
import 'package:silktech_users/features/users/presentation/bloc/user/user_bloc.dart';
import 'package:silktech_users/features/users/presentation/widgets/user_profile.dart';
import 'package:silktech_users/features/users/presentation/widgets/user_profile_preloader.dart';

class UserPageBody extends StatelessWidget {
  const UserPageBody({
    super.key,
    this.user,
  });

  final User? user;

  @override
  Widget build(BuildContext context) {
    if (user != null) {
      return UserProfile(user: user!);
    }

    final bloc = context.watch<UserBloc>();

    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        state.mapOrNull(
          error: (error) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                error.message,
              ),
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: bloc.state.maybeWhen(
          success: (user) => UserProfile(
            user: user,
          ),
          loading: () => const UserProfilePreloader(),
          orElse: () => Container(),
        ),
      ),
    );
  }
}
