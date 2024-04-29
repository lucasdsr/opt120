import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

export 'routes.dart';

import '../widgets/main_layout.dart';

// import '../pages/home_page.dart';
import '../pages/users/users_page.dart';
import '../pages/activities_page.dart';
import '../pages/users_activities_page.dart';
import '../pages/users/user_creation_page.dart';

Widget generatePage (Widget page, int sidebarIndex) {
  return
    MainLayout(page: page, sidebarIndex: sidebarIndex);
}

final router = GoRouter(
  initialLocation: '/users',
  routes: [
    GoRoute(
      path: '/users',
      builder: (context, state) => generatePage(UsersPage(), 0),
    ),
    GoRoute(
      path: '/users/create',
      builder: (context, state) => generatePage(UserCreationPage(), 0),
    ),
    GoRoute(
      path: '/activities',
      builder: (context, state) => generatePage(ActivitiesPage(), 1),
    ),
    GoRoute(
      path: '/user-activities',
      builder: (context, state) => generatePage(UsersActivitiesPage(), 2),
    ),
  ],
);