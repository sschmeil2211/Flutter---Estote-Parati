// ignore_for_file: unnecessary_this, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:estote_parati/src/providers/providers.dart';
import 'package:estote_parati/src/utils/utils.dart';
import 'package:estote_parati/src/widgets/widgets.dart';

class GroupPlanSectionScreen extends StatelessWidget {
  const GroupPlanSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: scoutColor,
      appBar: CustomizedAppBar(title: 'VALORES', context: context),
      body: Consumer<GroupPlanSectionProvider>(
        builder: (context, groupPlanSectionProvider, child){
          if(!groupPlanSectionProvider.loaded)
            return const LoadingProgressAnimation();

          return BodyWithList(
            children: List.generate(groupPlanSectionProvider.groupPlanSections[args['workArea']]?.length ?? 0, (index) => SlideCard(
              color: args['colorArea'],
              groupPlanSections: groupPlanSectionProvider.groupPlanSections[args['workArea']]?[index],
            ))
          );
        }
      )
    );
  }
}