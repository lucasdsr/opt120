import 'package:Opt120/task_manager/widgets/routes.dart';
import 'package:flutter/material.dart';

export 'task_manager.dart';

class TaskManager extends StatelessWidget {
  const TaskManager({ super.key });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
