import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:Opt120/utils/service/activities.dart';

import '../../widgets/custom_table.dart';

export 'activities_page.dart';

class ActivitiesPage extends StatefulWidget {
  @override
  ActivitiesPageState createState() => ActivitiesPageState();
}

class ActivitiesPageState extends State<ActivitiesPage> {
  List<Map<String, dynamic>> activityList = [];

  @override
  void initState(){
    super.initState();

    ActivityRequests().fetchActivities().then((users) => {
      setState(() {
        activityList = users;
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
                'Activities list',
                style:
                  TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  )
              ),
          ),
          CustomTable(data: activityList),
          Container(
            margin: EdgeInsets.only(top: 12),
            child:
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go('/activities/create');
                },
                child: Text('Create activity'),
              ),
          )
        ]
      )
    );
  }
}