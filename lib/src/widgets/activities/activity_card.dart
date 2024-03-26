// ignore_for_file: unnecessary_this
import 'package:flutter/material.dart';

import 'package:estote_parati/src/models/models.dart';
import 'package:estote_parati/src/utils/utils.dart';
import 'package:estote_parati/src/widgets/widgets.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final bool extendedCard;

  const ActivityCard({
    required this.activity,
    this.extendedCard = false,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return CustomizedCard(
      color: groupColor,
      headerText: this.activity.name,
      cornerColor: getBranchColor(activity.targetBranch),
      corner: Text(
        translateDurationType(this.activity.durationType),
        style: simpleStyle.copyWith(color: Colors.black)
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleSection(
            sectionTitle: 'Definición',
            text: this.activity.definition,
          ),
          ListSection(
            sectionTitle: 'Objetivos',
            items: this.activity.objectives,
          ),
          if(extendedCard)
            ListSection(
              sectionTitle: 'Materiales',
              items: this.activity.materials,
            ),
          if(extendedCard)
            SingleSection(
              sectionTitle: 'Desarrollo',
              text: this.activity.definition,
            ),
        ],
      )
    );
  }
} 

class SingleSection extends StatelessWidget {
  final String sectionTitle;
  final String text;

  const SingleSection({
    required this.sectionTitle,
    required this.text,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title(this.sectionTitle),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(this.text, style: bodyStyle),
        )
      ],
    );
  }

  Widget title(String title) => Text(title, style: sectionHeaderStyle);
}

class ListSection extends StatelessWidget {
  final String sectionTitle;
  final List<String> items;

  const ListSection({
    required this.sectionTitle,
    required this.items,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title(this.sectionTitle),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: List.generate(this.items.length, (index) => Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 12
                  ),
                ),
                Expanded(
                  child: Text(this.items[index], style: bodyStyle),
                ),
              ],
            )),
          ),
        )
      ],
    );
  }

  Widget title(String title) => Text(title, style: sectionHeaderStyle);
}