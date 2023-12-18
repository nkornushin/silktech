import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:silktech_users/features/users/presentation/pages/search_user_page.dart';
import 'package:silktech_users/features/users/presentation/pages/user_page.dart';
import 'package:silktech_users/features/users/presentation/pages/users_page.dart';

class RouterConatiner {
  RouteMap get routes => _buildRouteMap();

  RouteMap _buildRouteMap() {
    return RouteMap(
      routes: {
        '/': (_) => const MaterialPage(
              child: SearchUserPage(),
            ),
        '/users': (_) => const MaterialPage(
              child: UsersPage(),
            ),
        '/profile/:id': (info) => MaterialPage(
              child: UserPage(
                userId: int.parse(
                  info.pathParameters['id'] ?? '0',
                ),
              ),
            ),
      },
    );
  }
}
