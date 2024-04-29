import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

export 'routes.dart';

import '../widgets/main_layout.dart';

// import '../pages/home_page.dart';
import '../pages/users_page.dart';
import '../pages/activities_page.dart';
import '../pages/users_activities_page.dart';

import './my_app_state.dart';

Widget generatePage (BuildContext context, Widget page, int sidebarIndex) {
  return
    ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Task Manager',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        ),
        home: MainLayout(page: page, sidebarIndex: sidebarIndex),
      ),
    );
}

final router = GoRouter(
  initialLocation: '/users',
  routes: [
    GoRoute(
      path: '/users',
      builder: (context, state) => generatePage(context, UsersPage(), 0),
    ),
    GoRoute(
      path: '/activities',
      builder: (context, state) => generatePage(context, ActivitiesPage(), 1),
    ),
    GoRoute(
      path: '/user-activities',
      builder: (context, state) => generatePage(context, UsersActivitiesPage(), 2),
    ),
  ],
);