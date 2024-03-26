// ignore_for_file: unnecessary_this, curly_braces_in_flow_control_structures
import 'package:estote_parati/src/extensions/extensions.dart';
import 'package:flutter/material.dart';

import 'package:estote_parati/src/models/models.dart';
import 'package:estote_parati/src/utils/utils.dart';
import 'package:estote_parati/src/widgets/widgets.dart';

class SelectedAdvicesScreen extends StatelessWidget {
  const SelectedAdvicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GroupAdvice args = ModalRoute.of(context)!.settings.arguments as GroupAdvice;

    return Scaffold(
      backgroundColor: scoutColor,
      appBar: CustomizedAppBar(title: getDayAndMonthShortFormat(args.date), context: context),
      body: BodyWithList(
        children: List.generate(args.topics.length, (index) => CustomizedCard(
          color: groupColor,
          headerText: args.topics.keys.toList()[index].capitalize(),
          corner: Text('T${index + 1}', style: simpleStyle),
          body: Text(args.topics.values.toList()[index], style: bodyStyle)
        ))
      )
    );
  }
}
