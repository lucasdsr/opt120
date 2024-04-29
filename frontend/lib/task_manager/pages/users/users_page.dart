import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/custom_table.dart';

export 'users_page.dart';

class UsersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final userList = [
      {
        'name': 'user 1',
        'age': '21',
      },
      {
        'name': 'user 2',
        'age': '22',
      },
      {
        'name': 'user 3',
        'age': '23',
      },
    ];

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: 
              Text(
                'User list',
                style:
                  TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  )
              ),
          ),
          CustomTable(data: userList),
          Container(
            margin: EdgeInsets.only(top: 12),
            child:
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go('/users/create');
                },
                child: Text('Create user'),
              ),
          )
        ]
      )
    );
  }
}