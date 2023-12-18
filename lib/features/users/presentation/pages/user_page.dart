import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silktech_users/config/themes/colors.dart';
import 'package:silktech_users/config/themes/styles.dart';
import 'package:silktech_users/features/users/domain/entities/user.dart';
import 'package:silktech_users/features/users/presentation/bloc/user/user_bloc.dart';
import 'package:silktech_users/features/users/presentation/widgets/user_page_body.dart';
import 'package:silktech_users/injection_container.dart';

class UserPage extends StatefulWidget {
  const UserPage({
    super.key,
    required this.userId,
    this.user,
  });

  final int userId;
  final User? user;

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    if (widget.user == null) {
      getIt<UserBloc>().add(UserEvent.getUser(widget.userId));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<UserBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'User № ${widget.userId}',
            style: AppStyles.headline.copyWith(
              color: AppColors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: UserPageBody(
          user: widget.user,
        ),
      ),
    );
  }
}
