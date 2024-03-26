// ignore_for_file: unnecessary_this, curly_braces_in_flow_control_structures
import 'package:estote_parati/src/extensions/extensions.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:estote_parati/src/models/models.dart';
import 'package:estote_parati/src/providers/providers.dart';
import 'package:estote_parati/src/utils/utils.dart';
import 'package:estote_parati/src/widgets/widgets.dart';

class LastAdvicesScreen extends StatelessWidget {
  const LastAdvicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<GroupAdvice> advices = Provider.of<GroupAdviceProvider>(context, listen: false).groupAdvices;

    return Scaffold(
      backgroundColor: scoutColor,
      appBar: CustomizedAppBar(title: 'CONSEJOS', context: context),
      body: BodyWithList(
        children: List.generate(advices.length, (index) => InkWell(
          child: CustomizedCard(
            color: groupColor,
            headerText: getDayAndMonthShortFormat(advices[index].date),
            corner: Text(getYear(advices[index].date), style: simpleStyle),
            body: Text(
              advices[index].topics.keys.toList().map((str) => '- ${str.capitalize()}').join('\n'),
              style: simpleStyle
            )
          ),
          onTap: () => Navigator.pushNamed(context, 'selectedAdvicesScreen', arguments: advices[index]),
        ))
      )
    );
  }
}