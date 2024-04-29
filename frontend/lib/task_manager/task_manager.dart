import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

export 'task_manager.dart';

import './widgets/routes.dart';
import './widgets/my_app_state.dart';

class TaskManager extends StatelessWidget {
  const TaskManager({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp.router(
          title: 'Task Manager',
          routerConfig: router,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
          ),
        )
    );
  }
}
