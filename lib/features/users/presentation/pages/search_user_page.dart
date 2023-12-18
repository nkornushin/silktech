import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silktech_users/config/themes/colors.dart';
import 'package:silktech_users/config/themes/styles.dart';
import 'package:silktech_users/features/users/presentation/bloc/cubit/buttons_cubit.dart';
import 'package:silktech_users/features/users/presentation/widgets/search_user_page_body.dart';
import 'package:silktech_users/injection_container.dart';

class SearchUserPage extends StatelessWidget {
  const SearchUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: AppStyles.headline.copyWith(
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocProvider.value(
          value: getIt<ButtonsCubit>(),
          child: const SearchUserPageBody(),
        ),
      ),
    );
  }
}
