// ignore_for_file: unnecessary_this, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:estote_parati/src/models/models.dart';
import 'package:estote_parati/src/providers/providers.dart';
import 'package:estote_parati/src/utils/utils.dart';
import 'package:estote_parati/src/widgets/widgets.dart';

class GroupPlanScreen extends StatelessWidget {
  const GroupPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scoutColor,
      appBar: CustomizedAppBar(title: 'PLAN DE GRUPO', context: context),
      body: Consumer<GroupPlanProvider>(
        builder: (context, groupPlanProvider, child){
          GroupPlan lastGroupPlan = groupPlanProvider.groupPlans.last;
          return BodyWithList(
            children: List.generate(lastGroupPlan.workAreas.length, (index) => InkWell(
              child: CustomizedCard(
                color: getSectionColor(lastGroupPlan.workAreas[index]),
                headerText: '',
                body: Center(
                  child: Text(
                    translateWorkArea(lastGroupPlan.workAreas[index]),
                    style: bodyStyle.copyWith(color: Colors.black)
                  )
                ),
              ),
              onTap: () => Navigator.pushNamed(context, 'groupPlanSection', arguments: {'workArea': lastGroupPlan.workAreas[index].name, 'colorArea': getSectionColor(lastGroupPlan.workAreas[index])}),
            )),
          );
        },
      )
    );
  }
}