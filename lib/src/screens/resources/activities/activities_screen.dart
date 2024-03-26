// ignore_for_file: unnecessary_this, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:estote_parati/src/models/models.dart';
import 'package:estote_parati/src/providers/providers.dart';
import 'package:estote_parati/src/utils/utils.dart';
import 'package:estote_parati/src/widgets/widgets.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scoutColor,
      appBar: CustomizedAppBar(title: 'Actividades', context: context),
      body: Consumer<ActivityProvider>(
        builder: (context, activityProvider, child){
          if(!activityProvider.loaded)
            return const LoadingProgressAnimation();

          List<Activity> activities = activityProvider.activities;
          return BodyWithList(
            children: List.generate(activities.length, (index) => InkWell(
              child: ActivityCard(activity: activities[index]),
              onTap: () => Navigator.pushNamed(context, 'selectedActivityScreen', arguments: activities[index]),
            ))
          );
        }
      )
    );
  }
}