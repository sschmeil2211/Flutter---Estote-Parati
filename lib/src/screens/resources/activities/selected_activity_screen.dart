// ignore_for_file: unnecessary_this, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';

import 'package:estote_parati/src/models/models.dart';
import 'package:estote_parati/src/utils/utils.dart';
import 'package:estote_parati/src/widgets/widgets.dart';

class SelectedActivityScreen extends StatelessWidget {
  const SelectedActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Activity args = ModalRoute.of(context)!.settings.arguments as Activity;

    return Scaffold(
      backgroundColor: scoutColor,
      appBar: CustomizedAppBar(title: 'ACTIVIDADES', context: context),
      body: BodyWithList(
        children: [
          ActivityCard(activity: args, extendedCard: true)
        ]
      )
    );
  }
}
