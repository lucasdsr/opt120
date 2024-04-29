import 'package:Opt120/utils/service/users.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/custom_table.dart';

export 'users_page.dart';

class UsersPage extends StatefulWidget {
  @override
  UserPageState createState() => UserPageState();
}

class UserPageState extends State<UsersPage> {
  List<Map<String, dynamic>> userList = [];

  @override
  void initState(){
    super.initState();

    UserRequests().fetchUsers().then((users) => {
      setState(() {
        userList = users;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
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