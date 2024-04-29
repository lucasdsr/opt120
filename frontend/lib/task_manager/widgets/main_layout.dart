import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

export 'main_layout.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    super.key,
    required this.page,
    required this.sidebarIndex,
  });

  final Widget page;
  final int sidebarIndex;

  @override
  Widget build(BuildContext context) {

    void redirectTo (int index) {
      switch (index) {
        case 0:
          GoRouter.of(context).go('/users');
          break;
        case 1:
          GoRouter.of(context).go('/activities');
          break;
        case 2:
          GoRouter.of(context).go('/user-activities');
          break;
        default:
          GoRouter.of(context).go('/');
      }
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.people),
                      label: Text('Users'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.task),
                      label: Text('Actvities'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.list),
                      label: Text('User Activities'),
                    ),
                  ],
                  selectedIndex: sidebarIndex | 0,
                  onDestinationSelected: (value) {
                    redirectTo(value);
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
