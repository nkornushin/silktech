import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silktech_users/features/users/presentation/bloc/users_list/users_list_bloc.dart';
import 'package:silktech_users/features/users/presentation/widgets/users_list_item.dart';
import 'package:silktech_users/features/users/presentation/widgets/users_list_preloader.dart';
import 'package:silktech_users/injection_container.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  late ScrollController scrollController;

  @override
  void initState() {
    getIt<UsersListBloc>().state.mapOrNull(
          initial: (value) =>
              getIt<UsersListBloc>().add(const UsersListEvent.getUsers()),
        );

    scrollController = ScrollController()
      ..addListener(() {
        var nextPageTrigger = 0.8 * scrollController.position.maxScrollExtent;

        final state = getIt<UsersListBloc>().state;

        bool isNeedFetchData = state.maybeWhen(
          success: (_, isLoading, isNextPageExists) {
            return isNextPageExists && !isLoading;
          },
          orElse: () => false,
        );

        if (scrollController.position.pixels > nextPageTrigger &&
            isNeedFetchData) {
          getIt<UsersListBloc>().add(const UsersListEvent.getUsers());
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersListBloc, UsersListState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (users, isLoading, isNextPageExists) {
            return Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      getIt<UsersListBloc>()
                          .add(const UsersListEvent.refreshUsers());
                    },
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        if (isLoading && index == (users.length - 1)) {
                          return Column(
                            children: [
                              UsersListItem(
                                user: users[index],
                              ),
                              const UsersListPreloader(),
                            ],
                          );
                        }
                        return UsersListItem(
                          user: users[index],
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
          loading: () => const UsersListPreloader(),
          orElse: () => Container(),
        );
      },
    );
  }
}
