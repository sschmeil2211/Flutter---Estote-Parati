// ignore_for_file: curly_braces_in_flow_control_structures
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:estote_parati/src/utils/utils.dart';
import 'package:estote_parati/src/models/models.dart';
import 'package:estote_parati/src/widgets/widgets.dart';

class SlideCard extends StatefulWidget {
  final Color color;
  final GroupPlanSection? groupPlanSections;

  const SlideCard({
    required this.color,
    this.groupPlanSections,
    super.key
  });

  @override
  State<SlideCard> createState() => _SlideCardState();
}

class _SlideCardState extends State<SlideCard> {
  int currentIndex = 0;

  dynamic getSectionField(String? section){
    switch (section) {
      case 'diagnosis':
        return widget.groupPlanSections?.diagnosis;
      case 'strategicObjective':
        return widget.groupPlanSections?.strategicObjective.map((str) => '- $str').join('\n');
      case 'actions':
        return widget.groupPlanSections?.actions.map((str) => '- $str').join('\n');
      case 'concretionTime':
        return getDate(widget.groupPlanSections?.concretionTime ?? Timestamp.now());
      case 'responsible':
        return widget.groupPlanSections?.responsible;
      default:
        '';
    }
  }

  void onHorizontalDragEnd(DragEndDetails details) {
    if(details.primaryVelocity! > 0)
      setState(() {
        if (currentIndex > 0)
          currentIndex--;
      });
    else if(details.primaryVelocity! < 0)
      setState(() {
        if (currentIndex < 4)
          currentIndex++;
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: onHorizontalDragEnd,
      child: CustomizedCard(
        headerTextColor: Colors.black,
        color: widget.color,
        headerText: translateGroupPlanSection(widget.groupPlanSections?.sections[currentIndex]),
        corner: Text(
          '${currentIndex + 1}/5',
          style: simpleStyle.copyWith(color: Colors.black),
        ),
        body: Text(
          getSectionField(widget.groupPlanSections?.sections[currentIndex]).toString(),
          style: bodyStyle.copyWith(color: Colors.black),
        )
      ),
    );
  }
}
