import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'my_app_state.dart';
import 'my_home_page.dart';

export 'my_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({ super.key });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'My App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}
