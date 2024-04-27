import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'widgets/main_layout.dart';
import 'widgets/my_app_state.dart';

export 'task_manager.dart';

class TaskManager extends StatelessWidget {
  const TaskManager({ super.key });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Task Manager',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        ),
        home: MainLayout(),
      ),
    );
  }
}
